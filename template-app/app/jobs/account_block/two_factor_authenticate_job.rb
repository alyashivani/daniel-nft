module AccountBlock
  class TwoFactorAuthenticateJob < ApplicationJob     
    queue_as :default

    def perform
      accounts = AccountBlock::Account.all
      accounts.each do |account|
        thirty_day = ( account.account_verified_date + 30.days ) if account.account_verified_date.present?
        if thirty_day.present?
          if (Date.today >= thirty_day) && account.two_factor_auth? && account.account_status == "account_verified"
            account.update(account_status: "profile_created")
          end
        end
      end
    end
  end
end

