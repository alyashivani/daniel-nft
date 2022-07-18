module BxBlockProfile
  class FriendsSerializer < BuilderBase::BaseSerializer
    attributes *[
      :id,
      :country,
      :city,
      :receipient_id,
      :account_id,
      :connection_id,
      :about,
      :date_of_birth,
      :mobile_number,
      :follow
    ]

    attribute :account_id do |object,params|
      params[:user_id]
    end

    attribute :receipient_id do |object|
      object.account_id
    end

    attribute :connection_id do |object,params|
      record = BxBlockConnections::Connection.where("account_id = ? OR  receipient_id = ?",params[:user_id],params[:user_id])
      @record = record.where("account_id = ? OR  receipient_id = ?",object.account_id,object.account_id).last
      @record.present? ? @record.id : nil 
    end

    attribute :follow do |object,params|
      record = BxBlockConnections::Connection.where("account_id = ? OR  receipient_id = ?",params[:user_id],params[:user_id])
      @record = record.where("account_id = ? OR  receipient_id = ?",object.account_id,object.account_id).last
      @record.present? ? @record.follow : nil 
    end

    attribute :status do |object,params|
      record = BxBlockConnections::Connection.where("account_id = ? OR  receipient_id = ?",params[:user_id],params[:user_id])
      @record = record.where("account_id = ? OR  receipient_id = ?",object.account_id,object.account_id).last
      @record.present? ? @record.status : nil 
    end

    attribute :image do |object|
      object.image.image_url if object.image.present?
    end

    attribute :email do |object|
      object.account.email if object.account.present?
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

    attribute :is_blocked do |object, params|
      result = false
      @block_user = BxBlockBlockUsers::BlockUser.where("current_user_id =? and account_id =? ", params[:user_id], object.account_id).first
      result = true if @block_user.present?
      result
    end

    # attributes :photo do |object|
    #   Rails.application.routes.url_helpers.rails_blob_path(object.photo, only_path: true) if object.photo.attached?
    # end
  end
end