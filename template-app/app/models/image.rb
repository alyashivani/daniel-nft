class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :attached_item, polymorphic: true, optional: true
end