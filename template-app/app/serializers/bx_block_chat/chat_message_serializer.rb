module BxBlockChat
  class ChatMessageSerializer < BuilderBase::BaseSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :message, :account_id, :chat_id, :created_at, :updated_at, :account
  end
end