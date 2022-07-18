module BxBlockChat
  class Chat < BxBlockChat::ApplicationRecord
    self.table_name = :chats
    # has_many :accounts_chats,
    #          class_name: 'BxBlockChat::AccountsChatsBlock',
    #          dependent: :destroy
    # has_many :accounts, through: :accounts_chats
    has_many :messages, class_name: 'BxBlockChat::ChatMessage', dependent: :destroy

    belongs_to :sender, foreign_key: :sender_id, class_name: 'AccountBlock::Account'
    belongs_to :recipient, foreign_key: :recipient_id, class_name: 'AccountBlock::Account'

    validates :sender_id, uniqueness: { scope: :recipient_id }

    scope :between, -> (sender_id, recipient_id) do
      where(sender_id: sender_id, recipient_id: recipient_id).or(
        where(sender_id: recipient_id, recipient_id: sender_id)
      )
    end

    def self.get(sender_id, recipient_id)
      conversation = between(sender_id, recipient_id).first
      return conversation if conversation.present?

      create(sender_id: sender_id, recipient_id: recipient_id)
    end

    def opposed_user(user)
      user == recipient ? sender : recipient
    end

    # def admin_accounts
    #   accounts_chats.where(status: :admin).includes(:accounts).pluck('accounts.id')
    # end

    # def last_admin?(account)
    #   accounts.include?(account.id) && accounts.count == 1
    # end
  end
end
