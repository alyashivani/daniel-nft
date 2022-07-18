module AccountBlock
  class AccountsController < ApplicationController
    include BuilderJsonWebToken::JsonWebTokenValidation

    before_action :validate_json_web_token, only: [:search,:user_list, :search_history, :deactivate_account, :notification_setting, :show, :two_factor_authentication, :update_username, :update_name, :update_tutorial, :get_tutorial]
    before_action :find_account, only: [:show, :deactivate_account, :notification_setting, :two_factor_authentication, :update_username, :update_name, :update_tutorial, :get_tutorial]

    def create
      account_params = jsonapi_deserialize(params)
      query_email = account_params['email'].downcase
      account = EmailAccount.where('LOWER(email) = ?', query_email).first
      validator = EmailValidation.new(account_params['email'])
      return render json: {errors: [ {account: 'Email already exist'},]}, status: :unprocessable_entity if account || !validator.valid?
      @account = EmailAccount.new(jsonapi_deserialize(params))
      # @account.platform = request.headers['platform'].downcase if request.headers.include?('platform')
      @account.update(activated: false)
      if @account.save
        render json: EmailAccountSerializer.new(@account, meta: {
          token: encode(@account.id) }).serializable_hash, status: :created
      else
        render json: {errors: format_activerecord_errors(@account.errors)}, status: :unprocessable_entity
      end
    end

    def search
      blocked_by_ids = BxBlockBlockUsers::BlockUser.where(account_id: current_user.id).map(&:current_user_id)
      current_user.search_histories.create(search_params: search_params[:query])
      @search_history = current_user.search_histories.all.order(created_at: :desc).first(3)
      @accounts = AccountBlock::Account.search(search_params[:query]).results.map{|m| m.search_data(current_user)}
      @accounts.each do |acc|
        if blocked_by_ids.include?(acc[:id])
          @accounts.delete(acc)
        end
      end
      @posts = BxBlockPosts::Post.search(search_params[:query]).results.map{|m| m.search_data}
      @temp_posts = []
      @posts.each do |post|
        @temp_posts << post unless blocked_by_ids.include?(post[:account_id])
      end
      @nfts = BxBlockCfmetamask::Nft.search(search_params[:query]).results.map{|m| m.search_data}
      @temp_nfts = []
      @nfts.each do |nft|
        @temp_nfts << nft unless blocked_by_ids.include?(nft[:account_id])
      end
      if @accounts.present? or @temp_nfts.present? or @temp_posts.present?
        render json: {search_history: @search_history, users: @accounts, posts: @temp_posts, nfts: @temp_nfts}, status: :ok 
      else
        render json: {errors: [{message: 'No result found.'}]}, status: :ok
      end
    end

    def show
      if @account
        render json: AccountSerializer.new(@account).serializable_hash,status: :ok
      else
        render json: {errors: format_activerecord_errors(@account.errors)}, status: :unprocessable_entity
      end
    end

    def search_history
      @search_history = current_user.search_histories.all.order(created_at: :desc).first(3)
      if @search_history.present?
        render json: {search_history: @search_history}, status: :ok 
      else
        render json: {errors: [{message: 'No result found.'}]}, status: :ok
      end
    end

    def user_list
      @accounts = AccountBlock::Account.all
      if @accounts.present?
        render json: AccountBlock::AccountSerializer.new(@accounts, meta: {message: 'List of users.'}).serializable_hash, status: :ok
      else
        render json: {errors: [{message: 'Not found any user.'}]}, status: :ok
      end
    end

    def deactivate_account
      if @account.present?
        @account.update(activated: false, account_status: "deactivated")
        if @account.save
          render json: {Message: "Account Deactivated successfully"}, status: :ok
        else
          render json: {Message: "Account not deactivated"}, status: :unprocessable_entity
        end
      else
        render json: {errors: [ {user: 'Account not found'},]}, status: :unprocessable_entity
      end
    end

    def update_account_status
      AccountBlock::Account.all.map{|user| user.update(account_status: "account_verified") if user.present?}
    end

    def notification_setting
      if @account.present?
        @account.update_attributes(notification_params)
        if @account.save
          render json: {Message: "Notification alerts set successfully"}, status: :ok
        else
          render json: {Message: "Not set"}, status: :unprocessable_entity
        end
      else
        render json: {errors: [ {user: 'Account not found'},]}, status: :unprocessable_entity
      end
    end

    def two_factor_authentication
      if @account.present?
        @account.update_attributes(two_factor_auth: params[:account][:two_factor_auth])
        if @account.save
          render json: {Message: "Two Factor Authentication Set"}, status: :ok
        else
          render json: {Message: "Not set"}, status: :unprocessable_entity
        end
      else
        render json: {errors: [ {user: 'Account not found'},]}, status: :unprocessable_entity
      end
    end

    def find_user_by_username
      account = AccountBlock::Account.find_by(user_name: params[:account][:user_name])
      if account.present?
        render json: AccountBlock::AccountSerializer.new(account).serializable_hash, status: :ok
      else
        render json: {errors: [{message: 'Not found any user with username.'}]}, status: :ok
      end
    end

    def update_username
      if params[:account][:user_name].present?
        account = AccountBlock::Account.find_by(user_name: params[:account][:user_name])
        return render json: {errors: ["Username already exists"]}, status: :unprocessable_entity if account.present?
      end 
      if @account.update(account_params)
        render json: AccountSerializer.new(@account, meta: { message: "Username updated successfully" }).serializable_hash, status: :ok
      else
        render json: {
          errors: format_activerecord_errors(@account.errors)
        }, status: :unprocessable_entity
      end
    end

    def update_name
      if @account.update(account_params)
        render json: AccountSerializer.new(@account, meta: { message: "Name updated successfully" }).serializable_hash, status: :ok
      else
        render json: {
          errors: format_activerecord_errors(@account.errors)
        }, status: :unprocessable_entity
      end
    end

    def update_tutorial
      if @account.present?
        @account.tutorial.push(params[:tutorial])
        @account.save
        render json: {tutorial: @account.tutorial,message: "Tutorial update Successfully"}
      end
    end

    def get_tutorial
      if @account.present?
        render json: {tutorial: @account.tutorial,message: "Tutorial fetch Successfully"}
      end
    end

    private

    def encode(id)
      BuilderJsonWebToken.encode id
    end

    def search_params
      params.permit(:query)
    end

    def find_account
      @account = Account.find @token.id if @token.id.present?
    end

    def notification_params
      params.require(:account).permit(:notify_receive_request, :notify_accept_request, :notify_post_comment_reply, :push_receive_request, :push_accept_request, :push_post_comment_reply, :msg_accept_request, :msg_post_comment_reply, :msg_receive_request)
    end

    def account_params
      params.require(:account).permit(:user_name, :first_name, :last_name)
    end
  end
end