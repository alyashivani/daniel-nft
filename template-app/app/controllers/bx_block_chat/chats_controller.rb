module BxBlockChat
  class ChatsController < ApplicationController

    def search
      accounts = AccountBlock::Account.search(search_params[:query]).results.map{|m| m.search_data(current_user)}.pluck(:id) - [current_user.id]
      friends = AccountBlock::Account.friends(current_user.id).pluck(:account_id, :receipient_id).flatten - [current_user.id]
      
      @friend_list = AccountBlock::Account.where(id: (friends & accounts))
      @users = AccountBlock::Account.where(id: accounts - @friend_list.map(&:id))

      if @users.present? or @friend_list.present? 
        render json: {users: AccountBlock::AccountSerializer.new(@users), friends: AccountBlock::AccountSerializer.new(@friend_list)}, status: :ok 
      else
        render json: {errors: [{message: 'No result found.'}]}, status: :ok
      end
    end

    private

    def search_params
      params.permit(:query)
    end
  end
end
