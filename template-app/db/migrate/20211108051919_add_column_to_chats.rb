class AddColumnToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :recipient_id, :integer
    add_column :chats, :sender_id, :integer
    add_index :chats, [:recipient_id, :sender_id], unique: true
    remove_column :chats, :name, :string
  end
end
