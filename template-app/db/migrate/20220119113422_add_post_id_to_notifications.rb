class AddPostIdToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :post_id, :string
  end
end
