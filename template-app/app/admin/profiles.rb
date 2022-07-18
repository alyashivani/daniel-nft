ActiveAdmin.register BxBlockProfile::Profile, as: "Profile" do
  actions :all, :except => [:destroy, :new, :edit]
  config.breadcrumb = false
  menu false
  
  show do
    attributes_table do
      row :account_id do |acc|
        link_to AccountBlock::Account.find(acc.account_id).email, admin_account_path(acc.account_id)
      end
      row :mobile_number
      row :date_of_birth
      row :city
      row :state
      row :country 
      row :image do |profile|
        image_tag profile&.image&.image_url, width: 50, height: 50 if profile.image.present?
      end
      row :about
      row :created_at
      row :updated_at
    end
  end
end
