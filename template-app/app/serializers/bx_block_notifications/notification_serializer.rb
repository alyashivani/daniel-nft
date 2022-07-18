module BxBlockNotifications
  class NotificationSerializer
    include FastJsonapi::ObjectSerializer
    attributes *[
        :id,
        :created_by,
        :headings,
        :contents,
        :app_url,
        :is_read,
        :read_at,
        :created_at,
        :updated_at,
        :account,
        :image,
        :sender_id,
        :post_id,
        :sender_name,
        :sender_fullname
    ]
    attribute :image do |object|
      if object.sender_id.present?
        user = AccountBlock::Account.find_by_id(object.sender_id)&.profile
        if user.present?
          user.image.image_url if user.image.present?
        else
          ""
        end
      else
        ""
      end
    end

    attribute :created_at do |object|
      time_ago_in_words(object.created_at)
    end

    attribute :sender_name do |object|
      if object.sender_id.present?
        user = AccountBlock::Account.find_by_id(object.sender_id)&.user_name
      else
        ""
      end
    end

    attribute :sender_fullname do |object|
      if object.sender_id.present?
        user = AccountBlock::Account.find_by_id(object.sender_id)
        full_name = user.first_name.to_s + " " + user.last_name.to_s
      else
        ""
      end
    end

    attribute :connection do |object|
      BxBlockConnections::Connection.find_by_id(object.connection_id)
    end
  end
end
