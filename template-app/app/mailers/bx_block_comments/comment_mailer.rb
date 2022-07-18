module BxBlockComments
  class CommentMailer < ApplicationMailer
    default from: "no-reply@deegee.io"
    def comment_mailer
      @user = params[:user]
      @current_user = params[:current_user]
      @host = Rails.env.development? ? 'http://localhost:3000' : params[:host]
      mail(to: @user.email,
           subject: 'New comment on post') do |format|
        format.html { render 'comment_mailer' }
      end
    end
  end
end