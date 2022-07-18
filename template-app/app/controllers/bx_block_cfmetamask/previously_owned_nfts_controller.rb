module BxBlockCfmetamask
  class PreviouslyOwnedNftsController < ApplicationController
    include BuilderJsonWebToken::JsonWebTokenValidation

    before_action :validate_json_web_token

    def index
      @previous_nfts = current_user.previously_owned_nfts.order(created_at: :desc).as_json
      render :json => {:previously_owned_nfts => @previous_nfts}, status: :ok
    end
  end
end
