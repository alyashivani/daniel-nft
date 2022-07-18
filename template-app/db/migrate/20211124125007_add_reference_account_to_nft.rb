class AddReferenceAccountToNft < ActiveRecord::Migration[6.0]
  def change
    add_reference :nfts, :account, index: true
  end
end
