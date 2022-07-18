module AccountBlock
  class Account < AccountBlock::ApplicationRecord
    self.table_name = :accounts

    include Wisper::Publisher
    acts_as_tagger
    searchkick word_start: [:first_name, :last_name, :full_name, :email, :user_name], highlight: [:first_name, :last_name, :full_name], callbacks:  :async, batch_size: 10
    
    def search_data(current_user = nil)
      { 
        id: id, 
        first_name: first_name,
        last_name: last_name,
        full_name: full_name,
        user_name: user_name,
        email: email,
        image: self.profile&.image&.image_url,
        no_common_friends: BxBlockConnections::Connection.mutual_friend(self.id, current_user&.id),
        is_blocked: BxBlockBlockUsers::BlockUser.find_by(current_user_id: current_user&.id, account_id: self.id).present?,
        status: BxBlockConnections::Connection.where("( account_id = ? and receipient_id = ? ) or ( account_id = ? and receipient_id = ? )", current_user&.id, self.id, self.id, current_user&.id).first&.status
      }
    end

    def self.search_fields
      [:first_name, :last_name, :full_name, :user_name, { email: :exact }]
    end

    has_secure_password
    before_validation :parse_full_phone_number
    before_create :generate_api_key
    has_many :comments, class_name: 'BxBlockComments::Comment', dependent: :destroy
    has_one :blacklist_user, class_name: 'AccountBlock::BlackListUser', dependent: :destroy
    has_many :connections,class_name: "BxBlockConnections::Connection", dependent: :destroy
    has_many :block_users, class_name: "BxBlockBlockUsers::BlockUser",foreign_key: "current_user_id", dependent: :delete_all
    has_many :block_users_other, class_name: "BxBlockBlockUsers::BlockUser",foreign_key: "account_id", dependent: :delete_all
    has_many :posts, class_name: 'BxBlockPosts::Post', dependent: :destroy
    has_one :profile, class_name: 'BxBlockProfile::Profile', dependent: :destroy
    after_save :set_black_listed_user
    has_many :wallets, class_name: "BxBlockCfmetamask::Wallet", dependent: :destroy
    has_many :nfts, through: :wallets, class_name: "BxBlockCfmetamask::Nft", dependent: :destroy
    has_many :previously_owned_nfts, through: :wallets, class_name: "BxBlockCfmetamask::PreviouslyOwnedNft", dependent: :destroy
    has_many :messages, class_name: 'BxBlockChat::ChatMessage'
    has_many :chats, foreign_key: :sender_id, dependent: :destroy, class_name: "BxBlockChat::Chat"
    has_many :notifications, class_name: 'BxBlockNotifications::Notification', dependent: :destroy
    has_many :push_notifications, class_name: 'BxBlockPushNotifications::PushNotification', dependent: :destroy, foreign_key: "account_id"
    has_many :search_histories, class_name: 'BxBlockAdvancedSearch::SearchHistory', dependent: :destroy
    has_many :contacts, class_name: 'BxBlockAdminconsole::Contact', dependent: :destroy
    has_many :report_posts, class_name: 'BxBlockContentflag::ReportPost', dependent: :destroy
    enum status: %i[regular suspended deleted]
    enum account_status: %i[account_created profile_created account_verified deactivated]
    validates_uniqueness_of :email
    scope :active, -> { where(activated: true) }
    scope :existing_accounts, -> { where(status: ['regular', 'suspended']) }
    scope :friends, -> (user_id) { BxBlockConnections::Connection.where(' (receipient_id=? and status = ?) or (account_id = ? and status = ?)', user_id, 'approved', user_id, 'approved' ) }
    scope :follows, -> (user_id) { BxBlockConnections::Connection.where(' (receipient_id=? and status = ? and follow = ?) or (account_id = ? and status = ? and follow = ?)', user_id, 'approved', true, user_id, 'approved' , true) }
    after_create :set_username  
    before_destroy :delete_connection, :delete_notification  

    def full_name
      "#{first_name} #{last_name}".titleize
    end

    def notify(hsh)
      require 'uri'
      require 'net/http'
      require 'openssl'
      url =  URI("https://fcm.googleapis.com/fcm/send")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      data = {}
      data[:to] = self.device_id
     
      data[:notification] = {}
      data[:notification][:title] = hsh[:title]
      data[:notification][:body] = hsh[:body]
      if hsh[:instance_id].present?
        data[:notification][:instance_id] = hsh[:instance_id]
      else
        data[:notification][:instance_id] = ""
      end
      request = Net::HTTP::Post.new(url)
      request["Authorization"] = "key=AAAANv5D_xE:APA91bF510-qul1iah3jDNVbVjsWiHzAb1F5K3fIfw0MJDZNoym2V1RZp06SuaWVqiuL3bJD8wzee1H4lZ_-d2Af0pWfFJGXdcrrATRDWw-n9yiKo4t7urVw9Pz-km8t9cGkvhFbnPdD"
      request["content-type"] = 'application/json'
      request.body = data.to_json


      response = http.request(request)
      puts response.read_body
    end

    def twillio
      url = URI("https://chat.twilio.com/v2/Services/IS96f3ff1f3fb24cc4b3fa5de73535237f/Users" )
      auth = {:username => "AC73fe7421b55a79abf18ff08af698f37f", :password => "a023f4ba739db98c4fc886541824c77d"}
      response = HTTParty.get("#{url}", basic_auth: auth)
      response.parsed_response["users"]
    end

    def set_username
      username = "#{self.email[/^[^@]+/]}"
      if Account.where(user_name: username).present?
        self.user_name = "#{self.email[/^[^@]+/]}" + "#{self.id}"   
      else
        self.user_name = username
      end
    end

    def recive_request(user)
      client = Twilio::REST::Client.new
      response = client.messages.create({
        from: "+15672298605",
        to: self.country_code.to_s + self.phone_number,
        body: "You received new friend request from #{user.first_name}" + " #{user.last_name}"
      })
    end

    def accept_request(user)
      client = Twilio::REST::Client.new
      response = client.messages.create({
        from: "+15672298605",
        to: self.country_code.to_s + self.phone_number,
        body: "You friend request accepted by #{user.first_name}" + " #{user.last_name}"
      })
    end

    def post_comment(user)
      client = Twilio::REST::Client.new
      response = client.messages.create({
        from: "+15672298605",
        to: self.country_code.to_s + self.phone_number,
        body: "#{user.first_name}" + " #{user.last_name}" + "comment on your post"
      })
    end

    def comment_reply(current_user)
      client = Twilio::REST::Client.new
      response = client.messages.create({
        from: "+15672298605",
        to: self.country_code.to_s + self.phone_number,
        body: "#{user.first_name}" + " #{user.last_name}" + "reply on your comment"
      })
    end


    private

    def parse_full_phone_number
      phone = Phonelib.parse(full_phone_number)
      self.full_phone_number = phone.sanitized
      self.country_code      = phone.country_code
      self.phone_number      = phone.raw_national
    end

    def valid_phone_number
      unless Phonelib.valid?(full_phone_number)
        errors.add(:full_phone_number, "Invalid or Unrecognized Phone Number")
      end
    end

    def generate_api_key
      loop do
        @token = SecureRandom.base64.tr('+/=', 'Qrt')
        break @token unless Account.exists?(unique_auth_id: @token)
      end
      self.unique_auth_id = @token
    end

    def set_black_listed_user
      if is_blacklisted_previously_changed?
        if is_blacklisted
          AccountBlock::BlackListUser.create(account_id: id)
        else
          blacklist_user.destroy
        end
      end
    end

    def delete_connection
      AccountBlock::Account.friends(self.id).delete_all
    end

    def delete_notification
      BxBlockNotifications::Notification.where(sender_id: self.id).delete_all
    end

  end
end
