module AccountBlock
  class RegistrationMailer < ApplicationMailer
  	default from: ENV['MAIL_FROM']
	  def registration_mailer
      @user = params[:user]
      @host = Rails.env.development? ? 'http://localhost:3000' : params[:host]
      mail(to: @user.email,
           subject: 'Welcome to Deegee!') do |format|
        format.html { render 'registration_mailer' }
      end
    end
  end
end