module BxBlockCfmetamask
  class WalletSerializer < BuilderBase::BaseSerializer
    attributes :wallet_type, :address, :created_at, :updated_at
  end
end
