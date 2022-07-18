class ChangeSuspendDatatype < ActiveRecord::Migration[6.0]
  def change
    change_column :accounts, :suspend_until, :datetime
  end
end
