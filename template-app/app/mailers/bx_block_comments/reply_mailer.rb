module BxBlockComments
  class ReplyMailer < ApplicationMailer
    default from: "no-reply@deegee.io"
    def reply_mailer
      @user = params[:user]
      @current_user = params[:current_user]
      @host = Rails.env.development? ? 'http://localhost:3000' : params[:host]
      mail(to: @user.email,
           subject: 'Reply on your comment') do |format|
        format.html { render 'reply_mailer' }
      end
    end
  end
end