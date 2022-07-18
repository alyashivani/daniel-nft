module BxBlockAdminconsole
  class Contact < BxBlockAdminconsole::ApplicationRecord
    self.table_name = :contacts
    validates :subject, :message, :presence => true
    belongs_to :account, class_name: 'AccountBlock::Account'
  end    
end