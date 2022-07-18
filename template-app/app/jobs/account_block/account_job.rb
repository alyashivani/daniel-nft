module AccountBlock
  class AccountJob < ApplicationJob     
    queue_as :default

    def perform
      accounts = AccountBlock::Account.all
      accounts.each do |account|
        if account.suspend_until.present? and account.is_blacklisted 
          account.update(suspend_until: nil, is_blacklisted: false) if account.suspend_until == Date.today
        end
      end
    end
  end
end