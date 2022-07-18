module BxBlockPosts
  class PostSerializer < BuilderBase::BaseSerializer

    attributes *[
        :id,
        :name,
        :description,
        :token_id,
        :owner_id,
        :image_url,
        :animation_url,
        :nft_name,
        :nft_description,
        :eth_amount,
        :usd_amount,
        :account_id,
        :created_at,
        :updated_at
    ]

    attribute :time do |object|
      time = BxBlockPosts::Post.post_time(object.created_at)
    end

    attribute :account do |object, params|
      acc = object.account
      image = acc.profile.image.image_url if acc.profile.present? and acc.profile.image.present?
      {id: acc.id, first_name: acc.first_name, last_name: acc.last_name, full_name: acc.full_name, user_name: acc.user_name, image: image}
    end

    attribute :likes_count do |object|
      object.likes.count
    end

    attribute :user_name do |object|
      object.account.user_name if object.account.present?
    end

    attribute :is_liked do |object, params|
      object.likes.where(like_by_id: params[:current_user].id).present? if params[:current_user].present?
    end

    attribute :liked_by do |object|
      liked_by = AccountBlock::Account.find_by_id(object.likes.pluck(:like_by_id))
    end    

    attribute :comments_count do |object|
      object.comments.count
    end

    attribute :comments do |object, params|
      comments = []
      if object.comments.present?
        @comments = object.comments.where(comment_id: nil).order(created_at: :desc).limit(4)
        comments = BxBlockComments::CommentSerializer.new(@comments, params: {current_user: params[:current_user], filter_param: params[:filter_param] || "newest"})
      end
      comments
    end

    attribute :is_current_owner do |object, params|
      BxBlockCfmetamask::Nft.where(token_id: object.token_id, owner_id: object.owner_id).present?
    end
  end
end
