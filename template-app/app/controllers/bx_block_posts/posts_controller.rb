module BxBlockPosts
  class PostsController < ApplicationController
    include BuilderJsonWebToken::JsonWebTokenValidation

    before_action :validate_json_web_token
    before_action :find_post, only: [:update, :destroy]
    before_action :validate_wallet_owner, only: [:create], if: :post_condition
    before_action :followed_user, only: [:index]
    before_action :blocked_users_posts, :blocked_by_posts, only: [:trending_posts]

    def index
      posts = BxBlockPosts::Post.where(account_id: @users).order(updated_at: :desc).order(recent_update: :desc).page(params[:page] || 1).per(params[:per_page] || 10)
      friend_ids = AccountBlock::Account.friends(current_user.id).pluck(:account_id, :receipient_id).flatten.uniq - [current_user.id]
      friend_of_friend_ids = []
      friend_ids.each do |friend_id|
        friend_of_friend_ids += AccountBlock::Account.friends(friend_id).pluck(:account_id, :receipient_id).flatten.uniq - [current_user.id]
      end
      friend_of_friend_ids = friend_of_friend_ids.uniq - friend_ids
      commented_posts = []
      liked_posts = []
      BxBlockPosts::Post.where(account_id: friend_of_friend_ids).each do |post|
        commented_by = AccountBlock::Account.find_by(id: post.comments.where(account_id: friend_ids).pluck(:account_id).uniq.first)
        if commented_by.present?
          commented_posts << PostSerializer.new(post, params: {current_user: current_user}, meta: { action_by: AccountBlock::AccountSerializer.new(commented_by).serializable_hash, message: "#{commented_by.full_name} commented on this post"} ).serializable_hash
        else
          liked_by = AccountBlock::Account.find_by(id: post.likes.where(likeable_type: "BxBlockPosts::Post", like_by_id: friend_ids).pluck(:like_by_id).uniq.first)
          commented_posts << PostSerializer.new(post, params: {current_user: current_user}, meta: { action_by: AccountBlock::AccountSerializer.new(liked_by).serializable_hash, message: "#{liked_by.full_name} liked this post"} ).serializable_hash if liked_by.present?
        end
      end
      if posts.present?
        render json: PostSerializer.new(posts, params: {current_user: current_user}, meta: commented_posts).serializable_hash
      else
        render json: {data: []}, status: :ok
      end
    end

    def my_posts
      posts = current_user.posts.order(created_at: :desc)
      if posts.present?
        render json: PostSerializer.new(posts, params: {current_user: current_user}).serializable_hash
      else
        render json: {data: []}, status: :ok
      end
    end

    def friend_posts
      account = AccountBlock::Account.find(params[:user_id])
      posts = account.posts.order(created_at: :desc)
      if posts.present?
        render json: PostSerializer.new(posts, params: {current_user: current_user}).serializable_hash
      else
        render json: {data: []}, status: :ok
      end
    end

    def create
      if params[:post][:owner_id].present? and params[:post][:token_id].present? and params[:post][:description].present?
        wallet = current_user.wallets.find_or_initialize_by(address: params[:post][:owner_id].downcase, wallet_type: params[:post][:wallet_type]) if params[:post][:wallet_type].present?
        if wallet.save
          new_post = current_user.posts.new(@post_hash)
          new_post[:wallet_id] = wallet.id
          if new_post.save
            create_nft(wallet,new_post)
            render json: PostSerializer.new(new_post).serializable_hash, status: :ok
          else
            render json: {errors: format_activerecord_errors(new_post.errors)}, status: :unprocessable_entity
          end
        else
          render json: {errors: format_activerecord_errors(wallet.errors)}, status: :unprocessable_entity
        end
      elsif params[:post][:description].present?
        new_post = current_user.posts.new(post_params)
        if new_post.save
          render json: PostSerializer.new(new_post).serializable_hash, status: :ok
        else
          render json: {errors: format_activerecord_errors(new_post.errors)}, status: :unprocessable_entity
        end 
      else
        render json: {errors: "Data not present for post creation."}, status: :unprocessable_entity
      end
    end

    def create_nft(wallet,new_post)
      nft = BxBlockCfmetamask::Nft.find_or_create_by(token_id: new_post.token_id , owner_id: new_post.owner_id, name: new_post.nft_name, description: new_post.nft_description, image_url: new_post.image_url, image_preview_url: new_post.image_preview_url, image_thumbnail_url: new_post.image_thumbnail_url, image_original_url: new_post.image_original_url, animation_url: new_post.animation_url, animation_original_url: new_post.animation_original_url, external_link: new_post.external_link, wallet_id: wallet.id, account_id: current_user.id)
      nft.update(eth_amount: new_post.eth_amount, usd_amount: new_post.usd_amount)
    end

    def show
      @post = BxBlockPosts::Post.find(params[:id])
      if @post
        render json: PostSerializer.new(@post, params: {current_user: current_user}).serializable_hash,status: :ok
      else
        render json: {errors: format_activerecord_errors(@post.errors)}, status: :unprocessable_entity
      end
    end

    def update
      wallet = BxBlockCfmetamask::Wallet.find_by(address: @post.owner_id)
      @post.update(wallet_id: wallet.id)
      if @post.update(update_post_params)
        render json: PostSerializer.new(@post, params: {current_user: current_user}).serializable_hash,status: :ok
      else
        render json: {errors: format_activerecord_errors(@post.errors)}, status: :unprocessable_entity
      end
    end

    def search
      @posts = Post.where('description ILIKE :search', search: "%#{search_params[:query]}%")
      render json: PostSerializer.new(@posts, params: {current_user: current_user}).serializable_hash, status: :ok
    end

    def destroy
      return if @post.nil?
      if @post.destroy
        nft = BxBlockCfmetamask::Nft.find_by(token_id: @post.token_id, owner_id: @post.owner_id)
        nft.delete if nft.present?
        render json: PostSerializer.new(@post, params: {current_user: current_user}, meta: {message: "Post deleted succesfully!"}).serializable_hash,status: :ok
      else
        render json: {errors: format_activerecord_errors(@post.errors)}, status: :unprocessable_entity
      end
    end

    def like
      @post = BxBlockPosts::Post.find_by_id(params[:id])
      if @post.nil?
        return render json: { errors: [{ message: 'Post does not exist.' },]}, status: :unprocessable_entity
      end
      like = @post.likes.pluck(:like_by_id).include?(current_user.id) ? @post.likes.find_by(like_by_id: current_user.id) : @post.likes.build(like_by_id: current_user.id)
      if like.save
        render json: PostSerializer.new(@post, {params: {current_user: current_user}}).serializable_hash, status: :ok
      else
        render json: { errors: format_activerecord_errors(like.errors) },status: :unprocessable_entity
      end
    end

    def dislike
      @post = BxBlockPosts::Post.find_by_id(params[:id])
      like = @post.likes.find_by(like_by_id: current_user.id)
      if like.present?
        like.destroy
        render json: PostSerializer.new(@post, {params: {current_user: current_user}}).serializable_hash, status: :ok
      else
        render json: { errors: 'Record not found' }, status: :not_found
      end
    end

    def validate_wallet_owner
      result = BxBlockPosts::PostCreateApi.new(params[:post][:owner_id], params[:post][:token_id]).validate_nft
      if result.present?
        result = result.with_indifferent_access 
        @post_hash = post_params
        post_params = { nft_name:"name", nft_description:"description", image_url:"image_url", image_preview_url:"image_preview_url",image_thumbnail_url:"image_thumbnail_url", image_original_url:"image_original_url", animation_url:"animation_url",animation_original_url:"animation_original_url", external_link:"external_link" }
        price_params = {eth_amount:"eth_price", usd_amount:"usd_price"}
        post_params.each do |k,v|
          @post_hash[k] = result[:asset][v]
        end
        price_params.each do |k,v|
          @post_hash[k] = result[:asset][:last_sale][:total_price].to_f / 10**18 if (k.to_s == "eth_amount" and result[:asset][:last_sale].present? and result[:asset][:last_sale][:total_price].present?)
          history_price = Cryptocompare::PriceHistorical.find('ETH', 'USD', {'ts' => result[:asset][:last_sale][:event_timestamp].to_time.to_i})["ETH"]["USD"] if result[:asset][:last_sale].present?
          @post_hash[k] = (@post_hash["eth_amount"].to_f * history_price).round(3) if (k.to_s == "usd_amount" and result[:asset][:last_sale].present? and result[:asset][:last_sale][:payment_token].present?) and @post_hash["eth_amount"].present?
        end
      else
        return render json: { errors: 'NFT not found' }, status: :not_found
      end
    end

    def hashtag_posts
      current_user.search_histories.create(search_params: params[:tag])
      tag = ActsAsTaggableOn::Tag.find_by(name: params[:tag])
      if tag.present?
        @posts = BxBlockPosts::Post.joins(:tags).where(tags: {id: tag.id}).page(params[:page] || 1).per(params[:per_page] || 10)
        if @posts
          render json: PostSerializer.new(@posts, params: {current_user: current_user}).serializable_hash,status: :ok
        else
          render json: {errors: format_activerecord_errors(@posts.errors)}, status: :unprocessable_entity
        end
      else
        render json: {errors: 'Tag not found.'}, status: :unprocessable_entity
      end
    end

    def trending_posts
      @posts = BxBlockPosts::Post.where("virality_score > ?", 0).where.not(recent_update: nil).order("virality_score DESC", "recent_update DESC").page(params[:page] || 1).per(params[:per_page] || 10)
      @posts = @posts - @blocked_users_posts - @blocked_by_posts
      if @posts
        render json: PostSerializer.new(@posts, params: {current_user: current_user}).serializable_hash,status: :ok
      else
        render json: {errors: format_activerecord_errors(@posts.errors)}, status: :unprocessable_entity
      end
    end

    private

    def post_params
      params.require(:post).permit(:name, :description, :token_id, :owner_id, :nft_name, :nft_description, :image_url, :image_preview_url, :image_thumbnail_url, :image_original_url, :animation_url, :animation_original_url, :external_link, :usd_amount, :eth_amount)
    end

    def update_post_params
      params.require(:post).permit(:name, :description)
    end

    def nft_params
      params.require(:nft).permit(:token_id, :owner_id, :name, :description, :image_url, :image_preview_url, :image_thumbnail_url, :image_original_url, :animation_url, :animation_original_url, :external_link)
    end

    def find_post
      @post = current_user.posts.find(params[:id])
    end

    def search_params
      params.permit(:query)
    end

    def format_activerecord_errors(errors)
      result = []
      errors.each do |attribute, error|
        result << { attribute => error }
      end
      result
    end

    def followed_user
      @users = AccountBlock::Account.follows(current_user.id).pluck(:account_id, :receipient_id).flatten
    end

    def reported_posts
      @reported_posts = BxBlockPosts::Post.where(id: current_user.report_posts.pluck(:post_id))
    end

    def blocked_users_posts
      @blocked_users_posts = BxBlockPosts::Post.where(account_id: BxBlockBlockUsers::BlockUser.where(current_user_id: current_user&.id).map(&:account_id))
    end

    def blocked_by_posts
      @blocked_by_posts = BxBlockPosts::Post.where(account_id: BxBlockBlockUsers::BlockUser.where(account_id: current_user&.id).map(&:current_user_id))
    end

    def post_condition
      params[:post][:owner_id].present? and params[:post][:token_id].present?
    end
  end
end
