ActiveAdmin.register BxBlockConnections::Connection, as: "Friends" do
  # menu label: "Connections", priority: 7
  menu false
  actions :all, :except => [:destroy, :new, :edit]
  config.breadcrumb = false

  controller do
    def index
      if params[:user_id].present?
        AccountBlock::Account.friends(params[:user_id])
      end
      @page_title = "Connections" rescue nil
      super
    end 
  end

  index :title => @page_title do
    selectable_column
    
    column :receipient_id do |acc|
      if acc.receipient_id != params[:user_id].to_i
        link_to AccountBlock::Account.find(acc.receipient_id).email, admin_account_path(acc.receipient_id)
      else
        link_to AccountBlock::Account.find(acc.account_id).email, admin_account_path(acc.account_id)
      end
    end
    column :status
    column :follow
  end 
  
  show do
    attributes_table do
      row :receipient_id do |acc|
        link_to AccountBlock::Account.find(acc.receipient_id).email, admin_account_path(acc.receipient_id)
      end
      row :status
      row :follow
    end
  end
end