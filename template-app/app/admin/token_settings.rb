ActiveAdmin.register BxBlockSettings::GlobalSetting, as: "token setting" do
  menu label: "Token Setting", :parent => "Setting"
  config.breadcrumb = false
  actions :all, :except => [:delete]
  config.filters = false

  permit_params :token_valid_days

  index :title => "Token Setting" do
    id_column
    column :token_valid_days
    column :created_at
    column :updated_at
    actions
  end

  show :title => "Token Setting" do
    attributes_table do
      row :token_valid_days
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :token_valid_days
    end
    f.actions
  end

  controller do
    def action_methods
      if BxBlockSettings::GlobalSetting.first.present?
        super - ['new']
      else
        super
      end
    end
  end

end
