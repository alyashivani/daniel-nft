module BxBlockConn
  class AcceptRequestMailer < ApplicationMailer
  	default from: ENV['MAIL_FROM']
	  def accept_request_mailer
      @user = params[:user]
      @current_user = params[:current_user]
      @host = Rails.env.development? ? 'http://localhost:3000' : params[:host]
      mail(to: @user.email,
           subject: 'Friend Request Accepted') do |format|
        format.html { render 'accept_request_mailer' }
      end
    end
  end
end