module BxBlockConn
  class ReceiveRequestMailer < ApplicationMailer
  	default from: ENV['MAIL_FROM']
	  def receive_request_mailer
      @user = params[:user]
      @current_user = params[:current_user]
      @host = Rails.env.development? ? 'http://localhost:3000' : params[:host]
      mail(to: @user.email,
           subject: 'Friend Request Received') do |format|
        format.html { render 'receive_request_mailer' }
      end
    end
  end
end