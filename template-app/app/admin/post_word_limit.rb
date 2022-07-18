ActiveAdmin.register BxBlockSettings::Setting, as: "Post Word Limit Setting" do
  menu label: "Post Word Limit Setting", :parent => "Setting"
  config.breadcrumb = false
  actions :all, :except => [:delete]
  config.filters = false

  permit_params :post_word_limit

  index :title => "Post Word Limit Setting" do
    id_column
    column :post_word_limit
    actions
  end

  show :title => "Post Word Limit Setting" do
    attributes_table do
      row :post_word_limit
    end
  end

  form do |f|
    f.inputs do
      f.input :post_word_limit
    end
    f.actions
  end

  controller do
    def action_methods
      if BxBlockSettings::Setting.first.present?
        super - ['new']
      else
        super
      end
    end
  end

end
