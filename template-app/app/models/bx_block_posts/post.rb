module BxBlockPosts
  class Post < BxBlockPosts::ApplicationRecord
    self.table_name = :posts

    SECS_PER_MIN  =  60
    SECS_PER_HOUR =  60 * SECS_PER_MIN
    SECS_PER_DAY  =  24 * SECS_PER_HOUR
    SECS_PER_WEEK =   7 * SECS_PER_DAY
    SECS_PER_YEAR = 365 * SECS_PER_DAY
    SECS_PER_CENT = 100 * SECS_PER_YEAR
    SECS_PER_MLNM =  10 * SECS_PER_CENT
    SECS_PER_EON  =  1_000_000 * SECS_PER_MLNM

    acts_as_taggable
    include Validators
    belongs_to :account, class_name: 'AccountBlock::Account'
    belongs_to :wallet, class_name: "BxBlockCfmetamask::Wallet", optional: true
    validates_presence_of :description, message: "Write something about post."
    validates_uniqueness_of :token_id, scope: :owner_id, if: -> { self.token_id.present? }, message: "This NFT is already posted."
    validates_length_of :description, :maximum => BxBlockSettings::Setting.last.present? ? BxBlockSettings::Setting.last.post_word_limit : 250 
    
    has_many :comments, class_name: 'BxBlockComments::Comment', dependent: :destroy
    has_many :likes, as: :likeable, dependent: :destroy, class_name: 'BxBlockLike::Like'
    has_many :report_posts, class_name: "BxBlockContentflag::ReportPost", dependent: :destroy
    
    before_destroy :delete_notification

    searchkick word_start: [:owner_id, :token_id, :name, :description, :nft_name, :nft_description ], highlight: [:owner_id, :token_id, :name, :description, :nft_name, :nft_description ], callbacks:  :async, batch_size: 10

    def search_data
      { 
        id: id, 
        owner_id: owner_id,
        token_id: token_id,
        account_id: account_id,
        name: name,
        description: description,
        nft_name: nft_name,
        nft_description: nft_description,
        image_url: image_url,
        eth_amount: eth_amount,
        usd_amount: usd_amount,
        user_id: self.account.id,
        full_name: self.account.full_name,
        user_name: self.account.user_name,
        image: self.account.profile&.image&.image_url,
        likes_count: self.likes.count,
        comments_count: self.comments.count,
        time: BxBlockPosts::Post.post_time(self.created_at)
      }
    end

    def self.search_fields
      [:name, :nft_name, { owner_id: :exact }, { token_id: :exact }, :description, :nft_description]
    end

    def media_url
      media_arr = Array.new
      media.each do |m|
        media_hash = Hash.new
        media_hash['url'] = m.service_url(expires_in: Rails.application.config.active_storage.service_urls_expire_in)
        media_hash['content_type'] = m.content_type
        media_arr << media_hash
      end
      media_arr
    end

    def self.post_time(created_at)
      if created_at != nil
        secs = (Time.now.in_time_zone - created_at.in_time_zone).to_i 
        case secs
        when (0...SECS_PER_MIN)
          "#{secs} seconds"
        when (SECS_PER_MIN...SECS_PER_HOUR)
          "#{secs/SECS_PER_MIN} minutes"
        when (SECS_PER_HOUR...SECS_PER_DAY)
          "#{secs/SECS_PER_HOUR} hours"
        when (SECS_PER_DAY...SECS_PER_WEEK)
          "#{secs/SECS_PER_DAY} days"
        when (SECS_PER_WEEK...SECS_PER_YEAR)
          "#{secs/SECS_PER_WEEK} weeks"
        when (SECS_PER_YEAR...SECS_PER_CENT)
            "#{secs/SECS_PER_YEAR} years"
        when (SECS_PER_CENT...SECS_PER_MLNM)
          "#{secs/SECS_PER_CENT} centuries"
        when (SECS_PER_MLNM...SECS_PER_EON)
          "#{secs/SECS_PER_MLNM} millenia"
        else
          "#{secs/SECS_PER_EON} eons"
        end << " ago"
      end
    end

    def delete_notification
      BxBlockNotifications::Notification.where(post_id: self.id).delete_all
    end
  end
end
