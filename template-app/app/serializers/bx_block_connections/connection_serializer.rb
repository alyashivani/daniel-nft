module BxBlockConnections
	class ConnectionSerializer < BuilderBase::BaseSerializer
    attributes *[
      :id,
      :status,
      :receipient_id,
      :account_id,
      :follow,
      :first_name,
      :last_name,
      :image
    ]

    attribute :first_name do |object,params|
        user = AccountBlock::Account.find_by_id(object.account_id)
        if user.present?
          user.first_name
        end
  	end
  	attribute :last_name do |object,params|
      user = AccountBlock::Account.find_by_id(object.account_id)
      if user.present?
        user.last_name
      end
  	end
  	attribute :user_name do |object,params|
      user = AccountBlock::Account.find_by_id(object.account_id)
      if user.present?
        user.user_name
      end
  	end
  	attribute :image do |object,params|
      user = AccountBlock::Account.find_by_id(object.account_id)
      if user.present?
        user.profile.image.image_url if user.profile&.image.present? and user.profile.present?
      end
  	end
	end
end