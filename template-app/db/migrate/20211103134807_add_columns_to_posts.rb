class AddColumnsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :nft, foreign_key: true
    add_column :posts, :token_id, :string
    add_column :posts, :owner_id, :string
    add_column :posts, :nft_name, :string
    add_column :posts, :nft_description, :string
    add_column :posts, :image_url, :string
    add_column :posts, :image_preview_url, :string
    add_column :posts, :image_thumbnail_url, :string
    add_column :posts, :image_original_url, :string
    add_column :posts, :animation_url, :string
    add_column :posts, :animation_original_url, :string
    add_column :posts, :external_link, :string
    add_column :posts, :asset_details, :jsonb
  end
end
