module BxBlockProfile
  class ProfileSerializer < BuilderBase::BaseSerializer
    attributes *[
      :id,
      :country,
      :city,
      :state,
      :account_id,
      :about,
      :date_of_birth,
      :mobile_number,
      :country_code
    ]

    attribute :image do |object|
      object.image.image_url if object.image.present?
    end

    attribute :email do |object|
      object.account.email if object.account.present?
    end

    attribute :first_name do |object|
      object.account.first_name if object.account.present?
    end

    attribute :last_name do |object|
      object.account.last_name if object.account.present?
    end

    attribute :full_name do |object|
      object.account.full_name if object.account.present?
    end

    attribute :mobile_number do |object|
      object.mobile_number if object.present?
    end

    attribute :user_name do |object|
      object.account.user_name if object.account.present?
    end

    attribute :two_factor_auth_status do |object|
      object.account.two_factor_auth if object.account.present?
    end

  end
end
