module BxBlockProfile
  class PhotoValidation
    include ActiveModel::Validations
    attr_reader :image
    validates :image,  presence: :true
    validate :custom_validate

    def initialize(params)
      @image = params[:profile][:image] unless params[:profile].blank?
    end

    def custom_validate
      if @image.present?
        errors.add :image, 'Only JPEG, JPG and PNG file extensions are allowed.' unless [".jpeg", ".jpg", ".png"].include?(File.extname(@image))
      else
        errors.add :image, 'Please select photo before uploading'
      end
    end
  end
end
