module BxBlockProfile
  class PhotoSerializer < BuilderBase::BaseSerializer
    attributes *[
      :photo,
      :created_at,
      :updated_at
    ]
        
    # attributes :photo do |object|
    #   if object.photo.attachment
    #     object.photo.attachment.service_url rescue nil
    #   else
    #     "nil"
    #   end
    # end
  end
end