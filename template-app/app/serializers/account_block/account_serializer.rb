module AccountBlock
  class AccountSerializer < BuilderBase::BaseSerializer
    attributes *[
      :first_name,
      :last_name,
      :email,
      :full_name,
      :user_name,
      :activated,
      :account_status,
      :notify_receive_request,
      :notify_accept_request,
      :notify_post_comment_reply,
      :push_receive_request,
      :push_accept_request,
      :push_post_comment_reply,
      :msg_accept_request,
      :msg_post_comment_reply,
      :msg_receive_request,
      :created_at,
      :updated_at,
      :new_user
    ]

    attribute :image do |object|
      object.profile.image.image_url if object.profile&.image.present? and object.profile.present?
    end
  end
end
