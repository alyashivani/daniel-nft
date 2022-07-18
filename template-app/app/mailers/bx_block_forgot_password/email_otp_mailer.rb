module BxBlockForgotPassword
  class EmailOtpMailer < ApplicationMailer
    default from: ENV['MAIL_FROM']
    def otp_email
      @otp = params[:otp]
      @host = Rails.env.development? ? 'http://localhost:3000' : params[:host]
      @account = AccountBlock::Account.find_by(email: @otp.email)
      mail(
          to: @otp.email,
          # from: 'builder.bx_dev@engineer.ai',
          subject: 'Deegee Verification Code ') do |format|
        format.html { render 'otp_email' }
      end
    end
  end
end
