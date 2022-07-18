module BxBlockCfmetamask
	class Wallet < ApplicationRecord
		enum wallet_type: [:metamask]
	  belongs_to :account, class_name: 'AccountBlock::Account'
    has_many :nfts, class_name: "BxBlockCfmetamask::Nft", dependent: :destroy
    has_many :posts, class_name: "BxBlockPosts::Post", dependent: :destroy
    has_many :previously_owned_nfts, class_name: "BxBlockCfmetamask::PreviouslyOwnedNft", dependent: :destroy
    validates_uniqueness_of :address, :message => "Wallet already exist for another user"
	end
end
