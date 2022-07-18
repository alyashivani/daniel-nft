module BxBlockCfmetamask
  class PreviouslyOwnedNft < ApplicationRecord
    belongs_to :wallet, class_name: "BxBlockCfmetamask::Wallet"
    belongs_to :account, class_name: "AccountBlock::Account"
  end
end
