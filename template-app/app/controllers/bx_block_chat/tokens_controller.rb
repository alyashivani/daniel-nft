module BxBlockChat
  class TokensController < ApplicationController
    require 'twilio-ruby'
    include BuilderJsonWebToken::JsonWebTokenValidation

    before_action :validate_json_web_token, only: [:create]

    def create
      account_sid = ENV['TWILIO_ACCOUNT_SID']
      api_key = ENV['TWILIO_API_KEY']
      api_secret = ENV['TWILIO_API_SECRET']
      service_sid = ENV['TWILIO_CHAT_SERVICE_SID']
      push_credential_sid = 'CR0d2af7d7eeba9abc996e3ca44b05dede'
      identity = current_user.email

      grant = Twilio::JWT::AccessToken::ChatGrant.new
      grant.service_sid = service_sid
      grant.push_credential_sid = push_credential_sid
      token = Twilio::JWT::AccessToken.new( account_sid, api_key, api_secret,[grant], identity: identity, ttl: 86400 )
      
      token.add_grant(grant)
      render json: {email: current_user.email, token: token.to_jwt}
    end
  end
end