module BxBlockBlockUsers
  class BlockUsersSerializer < BuilderBase::BaseSerializer
    include FastJsonapi::ObjectSerializer
    attributes *[
      :current_user_id,
      :account_id,
      :created_at,
      :updated_at,
      :account
    ]

    attribute :image do |object|
      object.account.profile.image.image_url if object.account.profile.present? and object.account.profile.image.present? 
    end
  end
end
