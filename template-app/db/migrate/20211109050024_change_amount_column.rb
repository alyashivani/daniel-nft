class ChangeAmountColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :amount, :float
    add_column :posts, :usd_amount, :float
    add_column :posts, :eth_amount, :float
  end
end
