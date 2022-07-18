module BxBlockLogin
  class AccountAdapter
    include Wisper::Publisher

    def login_account(account_params)
      email = account_params.email.downcase
      account = AccountBlock::EmailAccount
        .where('LOWER(email) = ?', email)
        .first
        
      unless account.present?
        broadcast(:account_not_found)
        return
      end

      if account.is_blacklisted == true 
        broadcast(:suspended_temporarily) if account.suspend_until.present?
        broadcast(:suspended) if !account.suspend_until.present?
      elsif account.authenticate(account_params.password)
        token, refresh_token = generate_tokens(account.id)
        broadcast(:successful_login, account, token, refresh_token)
      else
        broadcast(:failed_login)
      end
    end

    def generate_tokens(account_id)
      token_setting = BxBlockSettings::GlobalSetting.first
      no_days = token_setting.present? ? token_setting.token_valid_days.to_i : 45 
      [
        BuilderJsonWebToken.encode(account_id, no_days.to_i.days.from_now, token_type: 'login'),
        BuilderJsonWebToken.encode(account_id, 1.year.from_now, token_type: 'refresh')
      ]
    end
  end
end
