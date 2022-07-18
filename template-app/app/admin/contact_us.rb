ActiveAdmin.register BxBlockAdminconsole::Contact, as: "Contact us" do
  menu label: "Contact us", priority: 10
  config.breadcrumb = false
  actions :all, :except => [:new, :edit]

  filter :created_at
  filter :updated_at
  filter :subject
  filter :account, :collection => AccountBlock::Account.pluck(:email, :id), :as => :select

  index :title => "Contact Us" do
    selectable_column
    id_column
    column 'Account' do |acc|
      link_to AccountBlock::Account.find(acc.account_id).email, admin_account_path(acc.account_id) if acc.account_id.present?
    end
    column :subject
    column :message
    
    actions
  end 

  show :title => "Contact Us" do
    attributes_table do
      row :account_id do |acc|
        link_to AccountBlock::Account.find(acc.account_id).email, admin_account_path(acc.account_id) if acc.account_id.present?
      end
      row :subject
      row :message
      row :created_at
      row :updated_at
    end
  end
end
