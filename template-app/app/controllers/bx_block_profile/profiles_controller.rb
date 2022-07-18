module BxBlockProfile
  class ProfilesController < ApplicationController
    include BuilderJsonWebToken::JsonWebTokenValidation

    before_action :validate_json_web_token
    before_action :find_profile, only: [:update_profile, :update_profile_picture, :user_profile, :verified_nfts]
    
    def create
      @profile = current_user.profile
      if !@profile.present?
        @profile = BxBlockProfile::Profile.create(profile_params.merge({account_id: current_user.id}))
        otp = generate_otp(current_user)
        render json: BxBlockProfile::ProfileSerializer.new(@profile, meta: {
            token: encode(current_user.id),
            otp: otp
          }).serializable_hash, status: :created
      else
        render json: { errors: "Profile Already Created" }, status: :unprocessable_entity
      end
    end

    def generate_otp(account)
      email_otp = AccountBlock::EmailOtp.new(email: current_user.email)
      if email_otp.save
        send_email_for email_otp
        return email_otp.pin
      else
        return render json: {
          errors: [email_otp.errors],
        }, status: :unprocessable_entity
      end
    end

    def send_email_for(otp_record)
      BxBlockForgotPassword::EmailOtpMailer
        .with(otp: otp_record, host: request.base_url)
        .otp_email.deliver
    end

    def verify_otp_for_profile_creation
      email_otp = AccountBlock::EmailOtp.where(email: params[:data][:email]).last
      account = AccountBlock::Account.where(email: params[:data][:email]).last
      return render json: {errors: [
        {phone: 'Email Not Found'},
      ]}, status: :unprocessable_entity if email_otp.blank?

      if email_otp.activated?
        return render json: {errors: [
          {pin: 'Email Already Activated.'},
        ]}, status: :ok
      end

      if email_otp.valid_until < Time.current
        email_otp.destroy
        return render json: {errors: [
          {pin: 'This OTP has expired, please request a new OTP code.'},
        ]}, status: :unauthorized
      end
      if email_otp.pin == params[:data][:otp].to_i
        email_otp.activated = true
        email_otp.save
        if account.present?
          account.update(account_status: "account_verified", account_verified_date: Date.today, activated: true, device_id: params[:token])
          account.save
          AccountBlock::RegistrationMailer
          .with(user: account, host: request.base_url)
          .registration_mailer.deliver
        end
        return render json: {
          meta: {
            message: "Email Confirmed Successfully"
          }
        }, status: :ok
      else
        return render json: {errors: [
          {pin: 'Invalid OTP for Email'},
        ]}, status: :unprocessable_entity
      end
    end

    def update_profile
      if @profile.update(profile_params)
        render json: ProfileSerializer.new(@profile, meta: {
            message: "Profile Updated Successfully"
          }).serializable_hash, status: :ok
      else
        render json: {
          errors: format_activerecord_errors(@profile.errors)
        }, status: :unprocessable_entity
      end
    end

    def update_profile_picture
      validator = PhotoValidation.new(params)
      return render json: {errors: [ {profile: validator.errors},]}, status: :unprocessable_entity unless validator.valid?        
      image = @profile.image || @profile.build_image 
      if image.update(profile_picture_params)
        render json: ProfileSerializer.new(@profile, meta: { message: "Profile Picture updated Successfully"}).serializable_hash, status: 200
      else
        render json: {
          errors: format_activerecord_errors(@profile.errors)
        }, status: :unprocessable_entity
      end
    end

    def user_profile
      render json: ProfileSerializer.new(@profile, meta: { message: "Successfully Loaded"}).serializable_hash, status: :ok
    end

    def verified_nfts
      @verified_nfts = current_user.nfts.order(created_at: :desc)
      render json: BxBlockCfmetamask::NftSerializer.new(@verified_nfts,{ params: {user_id: current_user.id}}).serializable_hash, status: 200
    end

    def friend_profile
      if BxBlockBlockUsers::BlockUser.where("(account_id =? and current_user_id =?)", current_user.id, params["user_id"]).present?
        render json: { errors: "you are blocked..." }, status: :unprocessable_entity
      else
        @account = AccountBlock::Account.find(params["user_id"])
        if @account.present?
          @profile = @account.profile
          render json: BxBlockProfile::FriendsSerializer.new(@profile,{ params: {user_id: current_user.id}}).serializable_hash, status: 200
        end
      end
    end

    def friend_nft
      if BxBlockBlockUsers::BlockUser.where("(account_id =? and current_user_id =?)", current_user.id, params["user_id"]).present?
        render json: { errors: "you are blocked..." }, status: :unprocessable_entity
      else
        @account = AccountBlock::Account.find(params["user_id"])
        if @account.present?
          @profile = @account.nfts
          render json: BxBlockProfile::NftSerializer.new(@profile).serializable_hash, status: 200
        end
      end
    end

    private

    def encode(id)
      BuilderJsonWebToken.encode id
    end

    def current_user
      @account = AccountBlock::Account.find_by(id: @token.id)
    end

    def find_profile
      @profile = current_user.profile
      render json: {status: false, message: "Profile not Present"} and return true  if @profile.nil?
    end

    def profile_params
      params.require(:profile).permit(:country, :state, :city, :date_of_birth, :mobile_number, :about, :user_name, :country_code)
    end

    def profile_picture_params
      params.require(:profile).permit(:image)    
    end
  end
end