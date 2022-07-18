class AddAccountStatusToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :account_status, :integer, default: 0, null: false
  end
end