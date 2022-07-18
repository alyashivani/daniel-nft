namespace :batch do
  desc 'NFT ownership update'
  task ownership_update: :environment do
    # The code to actually send our messages would go here
    BxBlockPosts::NftOwnershipUpdateJob.perform_later
  end
  task unsuspend_account: :environment do
    # The code to actually send our messages would go here
    AccountBlock::AccountJob.perform_later
  end
  task two_factor_authenticate_job: :environment do
    # The code to actually send our messages would go here
    AccountBlock::TwoFactorAuthenticateJob.perform_later
  end
end

