module BxBlockCfmetamask
  class NftSerializer < BuilderBase::BaseSerializer
    attributes *[
      :id, 
      :asset_id, 
      :token_id, 
      :owner_id, 
      :name, 
      :description, 
      :image_url,
      :image_preview_url,
      :image_thumbnail_url,
      :image_original_url,
      :animation_url,
      :animation_original_url,
      :external_link,
      :eth_amount,
      :usd_amount,
      :account_id,
      :wallet_id,
      :created_at, 
      :updated_at]

    attribute :account do |object, params|
      acc = object.account
      image = acc.profile.image.image_url if acc.profile.present? and acc.profile.image.present?
      {id: acc.id, first_name: acc.first_name, last_name: acc.last_name, full_name: acc.full_name, user_name: acc.user_name, image: image}
    end

    attribute :post do |object, params|
      post = BxBlockPosts::Post.find_by(owner_id: object.owner_id, token_id: object.token_id)
    end
  end
end
