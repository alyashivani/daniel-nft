module BxBlockProfile
    class NftSerializer < BuilderBase::BaseSerializer
  
      attributes *[
          :id,
          :name,
          :description,
          :token_id,
          :owner_id,
          :image_url,
          :animation_url,
          
          :eth_amount,
          :usd_amount,
          :account_id,
          :created_at,
          :updated_at
      ]
    end
end