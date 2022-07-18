module AccountBlock
  class EmailAccountSerializer
    include FastJsonapi::ObjectSerializer

    attributes *[
      :first_name,
      :last_name,
      :email,
      :user_name,
      :account_status,
      :created_at,
      :updated_at,
      :new_user
    ]
  end
end
