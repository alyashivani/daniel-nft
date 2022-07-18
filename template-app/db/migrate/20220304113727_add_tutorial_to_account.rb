class AddTutorialToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :tutorial,:string, array: true, default: []
  end
end
