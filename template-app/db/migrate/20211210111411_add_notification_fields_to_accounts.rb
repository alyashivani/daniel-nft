class AddNotificationFieldsToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :notify_receive_request, :boolean, default: true
    add_column :accounts, :notify_accept_request, :boolean, default: true
    add_column :accounts, :notify_post_comment_reply, :boolean, default: true
    add_column :accounts, :push_receive_request, :boolean, default: true
    add_column :accounts, :push_accept_request, :boolean, default: true
    add_column :accounts, :push_post_comment_reply, :boolean, default: true
  end
end
