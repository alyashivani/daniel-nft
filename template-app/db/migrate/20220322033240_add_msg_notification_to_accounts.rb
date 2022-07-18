class AddMsgNotificationToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :msg_receive_request,:boolean, default: true
    add_column :accounts, :msg_accept_request,:boolean, default: true
    add_column :accounts, :msg_post_comment_reply,:boolean, default: true
  end
end
