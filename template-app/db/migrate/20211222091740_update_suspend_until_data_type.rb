class UpdateSuspendUntilDataType < ActiveRecord::Migration[6.0]
  def change
    change_column :accounts, :suspend_until, :date
  end
end
