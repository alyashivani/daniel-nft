module BxBlockConnections
  class Connection < BxBlockConnections::ApplicationRecord
  	self.table_name = :connections
  	belongs_to :account, class_name: "AccountBlock::Account"
    before_destroy :delete_notification

    def self.mutual_friend(user_id, current_user_id)
      return 0 if user_id == current_user_id
      my_frnd = AccountBlock::Account.friends(current_user_id).pluck(:account_id, :receipient_id).flatten - [current_user_id]
      your_frnd = AccountBlock::Account.friends(user_id).pluck(:account_id, :receipient_id).flatten - [user_id, current_user_id]
      (my_frnd & your_frnd).count
    end

    private
    def delete_notification
      BxBlockNotifications::Notification.where(connection_id: self.id).delete_all
    end
	end
end