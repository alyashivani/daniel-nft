class AddFollowToConnections < ActiveRecord::Migration[6.0]
  def change
    add_column :connections, :follow, :boolean, :default => false
  end
end
