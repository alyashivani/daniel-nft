class AddNewUserToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :new_user, :boolean, default: true
  end
end
