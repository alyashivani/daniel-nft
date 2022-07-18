module BxBlockChat
  class AccountsChatsBlock < BxBlockChat::ApplicationRecord
    self.table_name = :accounts_chats
    belongs_to :chat, class_name: 'BxBlockChat::Chat'
    belongs_to :account, class_name: 'AccountBlock::Account'

    validates :chat_id, uniqueness: { scope: :account_id,
    message: "should added only one time on same chat" }
  end
end
