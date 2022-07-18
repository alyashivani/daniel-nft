module BxBlockConn
	class ConnectionsController < ApplicationController
    include BuilderJsonWebToken::JsonWebTokenValidation

    before_action :validate_json_web_token
  	before_action :current_user

  	def create
  		friend_request = current_user.connections.new()
  		friend_request.receipient_id = params[:receipient_id]
      record = BxBlockConnections::Connection.where("account_id = ? OR  receipient_id = ?",current_user.id,current_user.id)
      @record = record.where("account_id = ? OR  receipient_id = ?",params[:receipient_id],params[:receipient_id]).last
      if @record.present? 
        return render json: {errors: "Friend request already sent or received"}, status: :unprocessable_entity
      end
  		if friend_request.save
  			BxBlockNotifications::Notification.create(account_id: friend_request.receipient_id, headings: "Friend Request",contents: "You received new friend request from ", sender_id: current_user.id, connection_id: friend_request.id)
  			@notification = BxBlockNotifications::Notification.where(account_id: friend_request.receipient_id, is_read: false).count
        user = AccountBlock::Account.find(friend_request.receipient_id)
        RoomsChannel.broadcast_to "#{user.id}", count: @notification
        # ActionCable.server.broadcast user, message: {count: @notification, id: friend_request.receipient_id}
        # head :ok
        if user.notify_receive_request
          ReceiveRequestMailer
          .with(user: user, current_user: current_user, host: request.base_url)
          .receive_request_mailer.deliver
        end
        hsh = {}
        hsh[:title] = "Friend Request Received"
        hsh[:body] = "You received new friend request from #{current_user.first_name}" + " " +"#{current_user.last_name}"
        if user.push_receive_request
          user.notify(hsh)
        end

        if user.msg_receive_request
          user.recive_request(current_user)
        end
        render json: BxBlockConnections::ConnectionSerializer.new(friend_request
	      ).serializable_hash, status: :created
	    else
	      render json: {
          errors: format_activerecord_errors(friend_request.errors)
        }, status: :unprocessable_entity
  		end
  	end

    def accept_friend_request
      @friend_request = BxBlockConnections::Connection.where(' (receipient_id=? and status = ?) or (account_id = ? and status = ?)', current_user, 'pending', current_user, 'pending' ).find_by(account_id: params["account_id"])
      if @friend_request.present?
        @friend_request.update(status: params[:status], follow: true)
        BxBlockNotifications::Notification.create(account_id: @friend_request.account_id, headings: "Friend Request Accepted",contents: "Your friend requested was accepted by ",sender_id: current_user.id, connection_id: @friend_request.id)
        @notification = BxBlockNotifications::Notification.where(account_id: @friend_request.account_id, is_read: false).count
        user = AccountBlock::Account.find(@friend_request.account_id)
        RoomsChannel.broadcast_to "#{user.id}", count: @notification
        # ActionCable.server.broadcast user, message: {count: @notification, id: @friend_request.account_id}
        # head :ok
        if user.notify_accept_request
          AcceptRequestMailer
          .with(user: user, current_user: current_user, host: request.base_url)
          .accept_request_mailer.deliver
        end
        hsh = {}
        hsh[:title] = "Friend Request Accepted"
        hsh[:body] = "Your friend requested was accepted by #{current_user.first_name}"
        if user.push_accept_request
          user.notify(hsh)
        end
        if user.msg_accept_request
          user.accept_request(current_user)
        end
        render json: {message: "Friend Request Accepted"}
      else
        render json: {errors: "Please send friend request for accepting"},
          status: :unprocessable_entity
      end
    end

    def pending_request
      @friend_requests = BxBlockConnections::Connection.where(' (receipient_id=? and status = ?) ', current_user, 'pending' )
      if @friend_requests.present?
        render json: BxBlockConnections::ConnectionSerializer.new(@friend_requests, meta: {message: 'List of friend request.'
        }).serializable_hash, status: :ok
      else
        render json: {message: "No request found"}
      end
    end

    def requested
      @friend_requests = BxBlockConnections::Connection.where(' (account_id=? and status = ?) ', current_user, 'pending' )
      if @friend_requests.present?
        render json: BxBlockConnections::ConnectionSerializer.new(@friend_requests, meta: {message: 'List of friend request.'
        }).serializable_hash, status: :ok
      else
        render json: {message: "No request found"}
      end
    end

    def unfollow
      conn = BxBlockConnections::Connection.find(params[:connection_id])
      if conn.update(follow: false)
        render json: {message: "Unfollowed"}
      else
        render json: {errors: format_activerecord_errors(@friend_request.errors)},
          status: :unprocessable_entity
      end
    end

    def follow
      conn = BxBlockConnections::Connection.find(params[:connection_id])
      if conn.update(follow: true)
        render json: {message: "Followed"}
      else
        render json: {errors: format_activerecord_errors(@friend_request.errors)},
          status: :unprocessable_entity
      end
    end

    def unfriend
      conn = BxBlockConnections::Connection.find(params[:connection_id])
      if conn.destroy
        render json: {message: "Friend Removed"}
      else
        render json: {errors: format_activerecord_errors(@friend_request.errors)},
          status: :unprocessable_entity
      end
    end

    def friend_lists
      # @accounts = AccountBlock::Account.where(id: AccountBlock::Account.friends(current_user.id).pluck(:account_id, :receipient_id).flatten - [current_user.id])
      @connection = BxBlockConnections::Connection.where("account_id =? or receipient_id =?", current_user.id, current_user.id).where(status: "approved")
      
      if @connection.present?
        render json: BxBlockConnections::FriendListSerializer.new(@connection,{ params: {user_id: current_user.id}}).serializable_hash, status: :ok
      else
        render json: {errors: [{message: 'Not found any friend.'}]}, status: :ok
      end
    end

    def user_friends
      @friends = AccountBlock::Account.friends(params[:user_id])
      if @friends.present?
        no_of_common_friends = BxBlockConnections::Connection.mutual_friend(params[:user_id].to_i, current_user.id)
        hash_data = BxBlockConnections::FriendListSerializer.new(@friends,{ params: {user_id: params[:user_id].to_i}}).serializable_hash
        render json: hash_data.merge(no_of_common_friends: no_of_common_friends), status: :ok
      else
        render json: {errors: [{message: 'Not found any friend.'}]}, status: :ok
      end
    end

    def search_friend
      user = AccountBlock::Account.find(search_params[:user_id])
      result = AccountBlock::Account.search(search_params[:query]).results.map{|m| m.search_data(user)}
      friends = AccountBlock::Account.friends(user.id).pluck(:account_id, :receipient_id).flatten - [user.id]
      friend_ids = result.pluck(:id) & friends
      connections = BxBlockConnections::Connection.where(account_id: friend_ids, receipient_id: user.id).or(BxBlockConnections::Connection.where(account_id: user.id, receipient_id: friend_ids))
      if connections.present?
        render json: BxBlockConnections::FriendListSerializer.new(connections,{ params: {user_id: user.id}}).serializable_hash, status: :ok
      else
        render json: {errors: [{message: 'No result found.'}]}, status: :ok
      end
    end

    private

    def search_params
      params.permit(:query, :user_id)
    end
	end
end