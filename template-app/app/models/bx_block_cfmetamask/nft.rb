module BxBlockCfmetamask
	class Nft < ApplicationRecord
	  belongs_to :wallet, class_name: "BxBlockCfmetamask::Wallet"
    belongs_to :account, class_name: "AccountBlock::Account"

    validates_uniqueness_of :token_id, scope: :owner_id 

    searchkick word_start: [:owner_id, :token_id, :name, :description ], highlight: [:owner_id, :token_id, :name, :description ], callbacks:  :async, batch_size: 10

    def search_data      
      { 
        id: id, 
        owner_id: owner_id,
        token_id: token_id,
        account_id: account_id,
        name: name,
        description: description,
        image_url: image_url,
        eth_amount: eth_amount,
        usd_amount: usd_amount,
        user_id: self.account.id,
        full_name: self.account.full_name,
        user_name: self.account.user_name,
        image: self.account.profile&.image&.image_url
      }
    end

    def self.search_fields
      [:name, { owner_id: :exact }, { token_id: :exact }, :description]
    end
	end
end
