class CreatePreviouslyOwnedNfts < ActiveRecord::Migration[6.0]
  def change
    create_table :previously_owned_nfts do |t|
      t.string "token_id"
      t.string "owner_id"
      t.string "name"
      t.string "description"
      t.string "image_url"
      t.string "image_preview_url"
      t.string "image_thumbnail_url"
      t.string "image_original_url"
      t.string "animation_url"
      t.string "animation_original_url"
      t.string "external_link"
      t.string "asset_contract_address"
      t.string "permalink"
      t.jsonb "asset_details"
      t.float "usd_amount"
      t.float "eth_amount"
      t.references :wallet, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
