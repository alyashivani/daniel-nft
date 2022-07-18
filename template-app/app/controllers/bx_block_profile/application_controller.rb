module BxBlockProfile
  class ApplicationController < BuilderBase::ApplicationController
    include BuilderJsonWebToken::JsonWebTokenValidation
    
    before_action :validate_json_web_token

    rescue_from ActiveRecord::RecordNotFound, :with => :not_found

    def current_user
      AccountBlock::Account.find(@token.id)
    end
    
    private

    def not_found
      render :json => {errors: [{account: "Record not found"}]}, :status => :not_found
    end
  end
end
