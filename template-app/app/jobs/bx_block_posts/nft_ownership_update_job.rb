module BxBlockPosts
  class NftOwnershipUpdateJob < ApplicationJob     
    queue_as :default

    def perform
      nfts = BxBlockCfmetamask::Nft.all
      nfts.each do |nft|
        result = BxBlockPosts::PostCreateApi.new(nft.owner_id, nft.token_id).validate_nft
        if !result.present?
          wallet = BxBlockCfmetamask::Wallet.find_by(address: nft.owner_id)
          pnft = BxBlockCfmetamask::PreviouslyOwnedNft.find_or_create_by(token_id: nft.token_id , owner_id: nft.owner_id, name: nft.name, description: nft.description, image_url: nft.image_url, image_preview_url: nft.image_preview_url, image_thumbnail_url: nft.image_thumbnail_url, image_original_url: nft.image_original_url, animation_url: nft.animation_url, animation_original_url: nft.animation_original_url, external_link: nft.external_link, wallet_id: wallet.id, account_id: nft.account_id, eth_amount: nft.eth_amount, usd_amount: nft.usd_amount)
          nft = BxBlockCfmetamask::Nft.find_by(token_id: nft.token_id, owner_id: nft.owner_id)
          nft.destroy if nft.present?
        end
        sleep 10
      end
    end
  end
end