# This migration comes from bx_block_add_friends (originally 20210503045741)
class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.references :account, null: false, foreign_key: true
      t.integer :receipient_id
      t.string :status, :default => 'pending'

      t.timestamps
    end
  end
end
