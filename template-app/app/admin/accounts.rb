ActiveAdmin.register AccountBlock::Account, as: "Account" do
  menu label: "Users", priority: 3
  config.breadcrumb = false

  config.clear_action_items!
  action_item :edit, :only => :show do
    link_to "Edit User" , "/admin/accounts/#{resource.id}/edit"
  end
  permit_params :activated, :is_blacklisted, :suspend_until
  
  batch_action :destroy do |ids|
    redirect_to "/admin/accounts?q%5Btype_contains%5D=#{AccountBlock::Account.find_by(id: ids.last).type}&commit=Filter&order=id_desc", alert: "Account Successfully Deleted"
    ids.each do |account_id|
      account = AccountBlock::Account.find_by(id: account_id)
      account.destroy
    end
  end

  batch_action :activate do |ids|
    redirect_to "/admin/accounts?q%5Btype_contains%5D=#{AccountBlock::Account.find_by(id: ids.last).type}&commit=Filter&order=id_desc", alert: "Account Successfully Updated"
    ids.each do |account_id|
      account = AccountBlock::Account.find_by(id: account_id)
      account.update(activated: true)
    end
  end

  batch_action :deactivate do |ids|
    redirect_to "/admin/accounts?q%5Btype_contains%5D=#{AccountBlock::Account.find_by(id: ids.last).type}&commit=Filter&order=id_desc", alert: "Account Successfully Updated"
    ids.each do |account_id|
      account = AccountBlock::Account.find_by(id: account_id)
      account.update(activated: false)
    end
  end

  batch_action :blacklist, confirm: "If you want to blacklist accounts permanently then leave suspend until blank.", form: { suspend_until: :datepicker} do |ids, inputs|
    redirect_to "/admin/accounts?q%5Btype_contains%5D=#{AccountBlock::Account.find_by(id: ids.last).type}&commit=Filter&order=id_desc", alert: "Account Successfully Updated"
    ids.each do |account_id|
      account = AccountBlock::Account.find_by(id: account_id)
      account.update(is_blacklisted: true, suspend_until: inputs[:suspend_until])
    end
  end

  controller do
    def create
      @account = AccountBlock::Account.new(email: params[:account][:email], full_phone_number: params[:account][:full_phone_number], type: params[:account][:type], password: params[:account][:password])
      @account.save
    end

    def destroy
      redirect_to "/admin/accounts?q%5Btype_contains%5D=#{AccountBlock::Account.find_by(id: params[:id]).type}&commit=Filter&order=id_desc", alert: "Account Successfully Deleted"
      account_data = AccountBlock::Account.find_by(id: params[:id])
        account_data.destroy
    end

    def index
      @page_title = "Users" rescue nil
      super
    end 
  end

  index :title => @page_title do
    selectable_column
    id_column
    column :email
    column :full_name
    column :user_name
    column :account_status
    # column :account_verified_date
    # column :device_id
    # column :first_name
    # column :last_name
    # column :created_at
    column :activated
    column :is_blacklisted
    column :suspend_until
    
    actions do |user|
      item "Profile", "/admin/profiles/#{user.profile.id}", class: "member_link" if user.profile.present?
    end
  end 
  
  show do
    tabs do
      tab "User" do
        attributes_table_for account do
          row :email
          row :first_name
          row :last_name
          row :user_name
          row :activated
          row :is_blacklisted
          row :suspend_until
          row :account_status
          row :account_verified_date
          row :device_id
          row :push_accept_request
          row :push_receive_request
          row :push_post_comment_reply
          row :notify_accept_request
          row :notify_receive_request
          row :notify_post_comment_reply
          row :two_factor_auth
          row :created_at
          row :updated_at 
        end
      end

      tab "Profile" do
        if resource.profile.present?
          attributes_table_for "profile" do
            row :account_id do
              link_to AccountBlock::Account.find(resource.profile&.account_id).email, admin_account_path(resource.profile&.account_id) 
            end
            row (:mobile_number) {resource.profile&.mobile_number}
            row (:date_of_birth) {resource.profile&.date_of_birth}
            row (:city) {resource.profile&.city}
            row (:state) {resource.profile&.state}
            row (:country) {resource.profile&.country}
            row :image do |a|
              link_to(image_tag(resource.profile&.image&.image_url, :alt =>  "alt text", width: 50, height: 50), resource.profile&.image&.image_url, :target => :blank) if resource.profile&.image&.image_url.present?
            end
            row (:about) {resource.profile&.about}
            row (:created_at) {resource.profile&.created_at}
            row (:updated_at) {resource.profile&.updated_at}
          end
        end
      end

      tab "Wallets" do
        resource.wallets.order("created_at DESC").each_with_index do |wallet, index|
          panel "Wallet #{index + 1}" do
            attributes_table_for wallet do
              row (:wallet_type) {wallet.wallet_type}
              row (:address) {wallet.address}
              row (:account_id) do
                link_to AccountBlock::Account.find(wallet.account_id).email, admin_account_path(wallet.account_id)
              end
              row (:created_at) {wallet.created_at}
              row (:updated_at) {wallet.updated_at}
            end
          end
        end
      end

      tab "Posts" do
        resource.posts.order("created_at DESC").each_with_index do |post, index|
          panel "Post #{index + 1}" do
            attributes_table_for post do
              row :post do
                link_to post.id, admin_post_path(post.id)
              end
              # row (:name) {post.name}
              row (:description) {post.description}
              row (:nft_name) {post.nft_name}
              row (:nft_description) {post.nft_description}
              row (:owner_id) {post.owner_id}
              row :wallet do
                link_to post.owner_id, admin_wallet_path(BxBlockCfmetamask::Wallet.find_by(address: post.owner_id)&.id) if BxBlockCfmetamask::Wallet.find_by(address: post.owner_id).present?
              end
              row (:token_id) {post.token_id}
              row (:usd_amount) {post.usd_amount}
              row (:eth_amount) {post.eth_amount}
              row (:account_id) do
                link_to AccountBlock::Account.find(post.account_id).email, admin_account_path(post.account_id)
              end
              row :image do |a|
                link_to(image_tag(post.image_url, :alt =>  "alt text", width: 50, height: 50), post.image_url, :target => :blank) if post.image_url.present?
              end
              row (:image_preview_url) {post.image_preview_url}
              row (:image_original_url) {post.image_original_url}
              row (:image_thumbnail_url) {post.image_thumbnail_url}
              # row (:animation_url) {post.animation_url}
              row :animation_url do |a|
                link_to("Animation", post.animation_url, :target => :blank) if post.animation_url.present?
              end
              row (:animation_original_url) {post.animation_original_url}
              row (:external_link) {post.animation_original_url}
              row (:created_at) {post.created_at}
              row (:updated_at) {post.updated_at}
            end
          end
        end
      end

      tab "NFTs" do
        resource.nfts.order("created_at DESC").each_with_index do |nft, index|
          panel "NFT #{index + 1}" do
            attributes_table_for nft do
              row (:token_id) {nft.token_id}
              row (:nft_name) {nft.name}
              row (:nft_description) {nft.description}
              row (:owner_id) {nft.owner_id}
              row (:usd_amount) {nft.usd_amount}
              row (:eth_amount) {nft.eth_amount}
              row :wallet
              row :image do |a|
                link_to(image_tag(nft.image_url, :alt =>  "alt text", width: 50, height: 50), nft.image_url, :target => :blank) if nft.image_url.present?
              end
              row (:image_preview_url) {nft.image_preview_url}
              row (:image_original_url) {nft.image_original_url}
              row (:image_thumbnail_url) {nft.image_thumbnail_url}
              # row (:animation_url) {nft.animation_url}
              row :animation_url do |a|
                link_to("Animation", nft.animation_url, :target => :blank) if nft.animation_url.present?
              end
              row (:animation_original_url) {nft.animation_original_url}
              row (:external_link) {nft.animation_original_url}
              row (:created_at) {nft.created_at}
              row (:updated_at) {nft.updated_at}
            end
          end
        end
      end

      tab "Previously owned NFTs" do
        resource.previously_owned_nfts.order("created_at DESC").each_with_index do |nft, index|
          panel "NFT #{index + 1}" do
            attributes_table_for nft do
              row (:token_id) {nft.token_id}
              row (:nft_name) {nft.name}
              row (:nft_description) {nft.description}
              row (:owner_id) {nft.owner_id}
              row (:usd_amount) {nft.usd_amount}
              row (:eth_amount) {nft.eth_amount}
              row :wallet
              row :image do |a|
                link_to(image_tag(nft.image_url, :alt =>  "alt text", width: 50, height: 50), nft.image_url, :target => :blank) if nft.image_url.present?
              end
              row (:image_preview_url) {nft.image_preview_url}
              row (:image_original_url) {nft.image_original_url}
              row (:image_thumbnail_url) {nft.image_thumbnail_url}
              # row (:animation_url) {nft.animation_url}
              row :animation_url do |a|
                link_to("Animation", nft.animation_url, :target => :blank) if nft.animation_url.present?
              end
              row (:animation_original_url) {nft.animation_original_url}
              row (:external_link) {nft.animation_original_url}
              row (:created_at) {nft.created_at}
              row (:updated_at) {nft.updated_at}
            end
          end
        end
      end

      tab "Friends" do
        AccountBlock::Account.where(id: AccountBlock::Account.friends(resource.id).pluck(:receipient_id, :account_id).flatten - [resource.id]).order("created_at DESC").each_with_index do |connection, index|
          panel "Connection #{index + 1}" do
            attributes_table_for connection do
              row (:account) do 
                link_to connection.email, admin_account_path(connection.id)
              end
              row (:status) do 
                BxBlockConnections::Connection.where("account_id = ? OR  receipient_id = ?", connection.id, connection.id).where("account_id = ? OR  receipient_id = ?",resource.id,resource.id).last.status
              end
              row :follow do 
                BxBlockConnections::Connection.where("account_id = ? OR  receipient_id = ?", connection.id, connection.id).where("account_id = ? OR  receipient_id = ?",resource.id,resource.id).last.follow
              end
            end
          end
        end
      end

      tab "Block users" do
        BxBlockBlockUsers::BlockUser.where('current_user_id = ?', resource.id).order("created_at DESC").each_with_index do |user, index|
          panel "Block user #{index + 1}" do
            attributes_table do
              row (:account_id) do
                link_to AccountBlock::Account.find(user.account_id).email, admin_account_path(user.account_id)
              end
              row (:name) do
                link_to AccountBlock::Account.find(user.account_id).full_name, admin_account_path(user.account_id)
              end
            end
          end
        end
      end

      tab "Notification" do
        
        BxBlockNotifications::Notification.where('account_id = ?', resource.id).order("created_at DESC").each_with_index do |user, index|
          panel "Notification #{index + 1}" do
            attributes_table do
              row (:account_id) do
                link_to AccountBlock::Account.find(user.account_id).email, admin_account_path(user.account_id)
              end
              row (:name) do
                link_to AccountBlock::Account.find(user.account_id).full_name, admin_account_path(user.account_id)
              end
            end
          end
        end
      end
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :email, input_html: { disabled: true } 
      f.input :password if f.object.new_record?
      f.input :activated, as: :boolean
      f.input :is_blacklisted
      f.input :suspend_until, hint: 'If you want to blacklist accounts permanently then leave suspend until blank.'
    end
    f.actions
  end

  filter :created_at
  filter :first_name
  filter :last_name
  filter :email
  filter :account_status
  filter :is_blacklisted
end
