# frozen_string_literal: true
# This migration comes from bx_block_link_share (originally 20210319071837)

class CreateBxBlockLinkShareSocialMediaShares < ActiveRecord::Migration[6.0]
  def change
    create_table :social_media_shares do |t|
      t.integer :account_id
      t.boolean :is_whatsapp_shared, default: false
      t.boolean :is_facebook_shared, default: false
      t.boolean :is_twitter_shared, default: false
      t.boolean :is_instagram_shared, default: false
      t.timestamps
    end
  end
end
