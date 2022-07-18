module BxBlockChat
  class ChatMessage < BxBlockChat::ApplicationRecord
    self.table_name = :chat_messages
    belongs_to :chat, class_name: 'BxBlockChat::Chat'
    belongs_to :account, class_name: 'AccountBlock::Account'

    validates :message, presence: true
  end
end
