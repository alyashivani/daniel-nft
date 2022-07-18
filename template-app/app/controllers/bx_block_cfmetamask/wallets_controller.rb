module BxBlockCfmetamask
	class WalletsController < ApplicationController
    include BuilderJsonWebToken::JsonWebTokenValidation

    before_action :validate_json_web_token
		def create 
      wallet_type = wallet_params["wallet_type"]
      address = wallet_params["address"].downcase
			wallet = current_user.wallets.build(wallet_type: wallet_type, address: address)
      if wallet.save
        render json: WalletSerializer.new(wallet).serializable_hash,status: :ok
      else
        render json: {errors: format_activerecord_errors(wallet.errors)},
            status: :unprocessable_entity
      end
		end

    def index
      wallets = current_user.wallets
      if wallets
        render json: WalletSerializer.new(wallets).serializable_hash, status: :ok
      else
        render json: {errors: "No wallet found"}, status: :unprocessable_entity
      end
    end

		private 
		def wallet_params
			params.require(:wallet).permit(:wallet_type, :address)
		end

		def find_wallet
			 @wallet = current_user.wallets.find(params[:id])
		end
	end
end
