module BxBlockLogin
  class LoginsController < ApplicationController
    def create
        account = OpenStruct.new(jsonapi_deserialize(params))
        account.type = params[:data][:type]

        output = AccountAdapter.new

        output.on(:account_not_found) do |account|
          render json: {
            errors: [{
              failed_login: 'Account not found, or not activated',
            }],
          }, status: :unprocessable_entity
        end

        output.on(:suspended_temporarily) do |account|
          render json: {
            errors: [{
              failed_login: 'Your account has been temporarily suspended',
            }],
          }, status: :unauthorized
        end

        output.on(:suspended) do |account|
          render json: {
            errors: [{
              failed_login: 'Your account has been permanantly suspended',
            }],
          }, status: :unauthorized
        end

        output.on(:failed_login) do |account|
          render json: {
            errors: [{
              failed_login: 'Login Failed',
            }],
          }, status: :unauthorized
        end

        output.on(:successful_login) do |account, token, refresh_token|
          account.update(device_id: params[:data][:token], new_user: false)
          # if account.account_status == "deactivated"
            # otp = generate_otp(account)
            # return render json: AccountBlock::EmailAccountSerializer.new(account, meta: {
            #     token: token,
            #     refresh_token: refresh_token,
            #     otp: otp
            #   }).serializable_hash, status: :created
          # else
            return render json: AccountBlock::EmailAccountSerializer.new(account, meta: { token: token, 
              refresh_token: refresh_token, 
              message: "Login Successful",
            }).serializable_hash, status: :ok
          # end
        end

        output.login_account(account)
    end

    def generate_otp(account)
      email_otp = AccountBlock::EmailOtp.new(email: account.email)
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
  end
end