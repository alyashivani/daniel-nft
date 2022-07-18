ActiveAdmin.register BxBlockHelpCentre::InteractiveFaq, as: "Faqs" do
  menu label: "Faqs", priority: 7
  config.breadcrumb = false
  actions :all

  permit_params :question, :answer

  index do
    selectable_column
    id_column
    column :question
    column :answer 
    actions
  end

  show do
    attributes_table do
      row :id
      row :question
      row :answer 
    end
  end

  form do |f|
    f.inputs do
      f.input :question, label: "Question"
      f.input :answer, label: "Answer"
    end
    f.actions do
      f.action :submit
      f.cancel_link(action: 'index')
    end
  end
end