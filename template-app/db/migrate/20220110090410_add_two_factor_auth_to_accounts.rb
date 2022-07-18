class AddTwoFactorAuthToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :two_factor_auth, :boolean, default: true
    add_column :accounts, :account_verified_date, :date
  end
end
