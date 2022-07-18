class AddReferenceWalletPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :wallet, index: true
  end
end
