class RemoveCategoryFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_reference :posts, :category, index: true, foreign_key: true
  end
end
