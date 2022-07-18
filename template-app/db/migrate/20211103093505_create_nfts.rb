class CreateNfts < ActiveRecord::Migration[6.0]
  def change
    create_table :nfts do |t|
      t.string :asset_id
      t.string :token_id
      t.string :owner_id
      t.string :name
      t.string :description
      t.string :image_url
      t.string :image_preview_url
      t.string :image_thumbnail_url
      t.string :image_original_url
      t.string :animation_url
      t.string :animation_original_url
      t.string :external_link
      t.string :asset_contract_address
      t.string :permalink
      t.jsonb :asset_details
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
