ActiveAdmin.register BxBlockCfmetamask::Wallet, as: "Wallet" do
  menu label: "Wallets", priority: 4
  # menu true
  config.breadcrumb = false
  actions :all, :except => [:new, :edit]

  filter :created_at
  filter :updated_at
  filter :address
  filter :wallet_type
  filter :account, :collection => AccountBlock::Account.pluck(:email, :id), :as => :select

  index :title => @page_title do
    selectable_column
    id_column
    column 'Account' do |acc|
      link_to AccountBlock::Account.find(acc.account_id).email, admin_account_path(acc.account_id) if acc.account_id.present?
    end
    column :address
    column :wallet_type
    actions
  end 

  show do
    attributes_table do
      row :wallet_type
      row :address
      row :account_id do |acc|
        link_to AccountBlock::Account.find(acc.account_id).email, admin_account_path(acc.account_id) if acc.account_id.present?
      end
      row :created_at
      row :updated_at
    end
  end

end
