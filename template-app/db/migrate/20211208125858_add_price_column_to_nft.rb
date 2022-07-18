class AddPriceColumnToNft < ActiveRecord::Migration[6.0]
  def change
    add_column :nfts, :usd_amount, :float
    add_column :nfts, :eth_amount, :float
  end
end
