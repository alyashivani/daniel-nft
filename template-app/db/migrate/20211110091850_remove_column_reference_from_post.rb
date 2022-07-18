class RemoveColumnReferenceFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_reference :posts, :nft, foreign_key: true
    remove_column :posts, :body, :text
    remove_column :posts, :location, :string
  end
end
