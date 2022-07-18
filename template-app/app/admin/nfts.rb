ActiveAdmin.register BxBlockCfmetamask::Nft, as: "Nft" do
  menu label: "Nfts", priority: 6
  config.breadcrumb = false
  actions :all, :except => [:new, :edit]

  filter :created_at
  filter :updated_at
  filter :owner_id
  filter :account, :collection => AccountBlock::Account.pluck(:email, :id), :as => :select

  index :title => @page_title do
    selectable_column
    id_column
    column 'Account' do |acc|
      link_to AccountBlock::Account.find(acc.account_id).email, admin_account_path(acc.account_id) if acc.account_id.present?
    end
    column :owner_id
    column :name
    column :image do |a|
      link_to(image_tag(a.image_url, :alt =>  "alt text", width: 50, height: 50), a.image_url, :target => :blank) if a.image_url.present?
    end
    column :animation_url do |a|
      link_to("Animation", a.animation_url, :target => :blank) if a.animation_url.present?
    end
    column :wallet
    
    actions
  end 

  show do
    attributes_table do
      row :token_id
      row :owner_id
  	  row :wallet
      row :asset_id
      row :name
      row :description
      row :eth_amount
      row :usd_amount
      row :account_id do |acc|
        link_to AccountBlock::Account.find(acc.account_id).email, admin_account_path(acc.account_id) if acc.account_id.present?
      end
      row :image do |a|
        link_to(image_tag(a.image_url, :alt =>  "alt text", width: 50, height: 50), a.image_url, :target => :blank) if a.image_url.present?
      end
      row :image_preview_url
      row :image_original_url
      row :image_thumbnail_url
      row :animation_url do |a|
      	link_to("Animation", a.animation_url, :target => :blank) if a.animation_url.present?
  	  end
      row :animation_original_url
      row :external_link
      row :created_at
      row :updated_at
    end
  end
end
