# frozen_string_literal: true

module BuilderJsonWebToken
  module JsonWebTokenValidation
    ERROR_CLASSES = [
      JWT::DecodeError,
      JWT::ExpiredSignature,
    ].freeze

    private

    def validate_json_web_token
      token = request.headers[:token] || params[:token]

      begin
        @token = JsonWebToken.decode(token)
        account = AccountBlock::Account.find(@token.id)
        return render json: { errors: 'Your account is permanently suspended.' }, status: :unauthorized if account.is_blacklisted == true and !account.suspend_until.present?
        return render json: { errors: 'Your account is temporarily suspended.' }, status: :unauthorized if account.is_blacklisted == true and account.suspend_until.present?
        # return render json: { errors: 'Account is not activated.' }, status: :unauthorized if account.activated == false
      rescue *ERROR_CLASSES => exception
        handle_exception exception
      end
    end

    def handle_exception(exception)
      # order matters here
      # JWT::ExpiredSignature appears to be a subclass of JWT::DecodeError
      case exception
      when JWT::ExpiredSignature
        return render json: { errors: [token: 'Token has Expired'] },
          status: :unauthorized
      when JWT::DecodeError
        return render json: { errors: [token: 'Invalid token'] },
          status: :bad_request
      end
    end
  end
end
