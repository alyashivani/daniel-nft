module BxBlockNotifications
  class NotificationsController < ApplicationController
    include BuilderJsonWebToken::JsonWebTokenValidation

    before_action :validate_json_web_token
    
    def index
      @notifications = Notification.where('account_id = ?', current_user.id).order("created_at DESC")
      if @notifications.present?
        render json: NotificationSerializer.new(@notifications, meta: {
            message: "List of notifications."}).serializable_hash, status: :ok
      else
        render json: {errors: [{message: 'No notification found.'},]}, status: :ok
      end
    end

    def show
      @notification = Notification.find(params[:id])
      render json: NotificationSerializer.new(@notification, meta: {
          message: "Success."}).serializable_hash, status: :ok
    end

    def create
      @notificat = Notification.new(headings: "hello", contents: "testing", account_id: current_user.id)
      if @notificat.save
        @notification = Notification.where(account_id: 1).count
        ActionCable.server.broadcast 'rooms_channel', message: {count: @notification , notification: @notificat}
        head :ok
        # render json: NotificationSerializer.new(@notificat, meta: {
        #     message: "Notification created."}).serializable_hash, status: :created
      # else
      
        # @notification = Notification.where(account_id: current_user.id).count
        # ActionCable.server.broadcast 'rooms_channel', count: @notification
        # head :ok
      end
    end

    def badge_count

      @notification = Notification.where(account_id: current_user.id, is_read: false ).count
      # user = AccountBlock::Account.find(current_user.id)
      RoomsChannel.broadcast_to "#{current_user.id}", count: @notification
      head :ok

      # render json: NotificationSerializer.new(@notification, meta: {
      #       message: "List of notifications."}).serializable_hash, status: :ok
    end

    def read_notification
      @notification = Notification.find(params["data"]["id"])
      if @notification.update(is_read: true, read_at: DateTime.now)
        render json: {message: "Notification read successfully."}, status: :ok
      end
    end

    def destroy
      @notification = Notification.find(params[:id])
      if @notification.destroy
        render json: {message: "Deleted."}, status: :ok
      else
        render json: {errors: format_activerecord_errors(@notification.errors)},
               status: :unprocessable_entity
      end
    end

    def delete_all
      @notifications = Notification.where('account_id = ?', current_user.id)
      if @notifications.present?
        @notifications.delete_all
      end
    end

    private

    def notification_paramas
      params.require(:notification).permit(
        :headings, :contents, :app_url, :account_id
      ).merge(created_by: @current_user.id)
    end

    def format_activerecord_errors(errors)
      result = []
      errors.each do |attribute, error|
        result << { attribute => error }
      end
      result
    end
  end
end
