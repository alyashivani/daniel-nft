module BxBlockChat
  class ChatSerializer < BuilderBase::BaseSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :name

    has_many :accounts, serializer: ::AccountBlock::AccountSerializer
  end
end
