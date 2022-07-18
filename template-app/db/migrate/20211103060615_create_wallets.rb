class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.integer :wallet_type, default: 0
      t.string :address
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
