class AddExtraColumnsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :amount, :float
  end
end
