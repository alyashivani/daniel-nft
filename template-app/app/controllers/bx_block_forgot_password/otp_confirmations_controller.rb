module BxBlockForgotPassword
  class OtpConfirmationsController < ApplicationController
    def create
      if create_params[:token].present? && create_params[:otp_code].present?
        # Try to decode token with OTP information
        begin
          token = BuilderJsonWebToken.decode(create_params[:token])
        rescue JWT::ExpiredSignature
          return render json: {
            errors: [{
              pin: 'OTP has expired, please request a new one.',
            }],
          }, status: :unauthorized
        rescue JWT::DecodeError => e
          return render json: {
            errors: [{
              token: 'Invalid token',
            }],
          }, status: :bad_request
        end

        # Try to get OTP object from token
        begin
          otp = token.type.constantize.find(token.id)
        rescue ActiveRecord::RecordNotFound => e
          return render json: {
            errors: [{
              otp: 'Token invalid',
            }],
          }, status: :unprocessable_entity
        end

        # Check OTP code
        if otp.pin == create_params[:otp_code].to_i
          otp.activated = true
          otp.save
          render json: {
            messages: [{
              otp: 'OTP validation success',
            }],
          }, status: :created
        else
          return render json: {
            errors: [{
              otp: 'Invalid OTP code',
            }],
          }, status: :unprocessable_entity
        end
      else
        return render json: {
          errors: [{
            otp: 'Token and OTP code are required',
          }],
        }, status: :unprocessable_entity
      end
    end

    def verify_otp
      email_otp = AccountBlock::EmailOtp.where(email: params[:data][:email]).last
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
      if email_otp.pin == params[:data][:otp_code].to_i #|| params[:data][:otp_code].to_i == 111111
        email_otp.activated = true
        email_otp.save
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

    private

    def create_params
      params.require(:data)
        .permit(*[
          :email,
          :token,
          :otp_code,
          :new_password,
        ])
    end
  end
end
