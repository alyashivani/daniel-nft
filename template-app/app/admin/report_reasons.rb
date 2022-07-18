ActiveAdmin.register BxBlockContentflag::ReportReason, as: "ReportReason" do
  menu label: "Report Reasons", priority: 8
  config.breadcrumb = false
  actions :all
  permit_params :content, sub_reasons_attributes: [:id, :content, :report_reason_id]

  index :title => @page_title do
    selectable_column
    id_column
    column :content
    
    actions
  end 

  show do
    attributes_table do
      row :id
      row :content 
      row :created_at
      row :updated_at 
      
      report_reason.sub_reasons.each_with_index do |sr, index|
        panel "Sub reasons #{index + 1}" do
          attributes_table_for sr do
            row :content do sr.content end
            row :created_at do sr.created_at end
            row :updated_at do sr.updated_at end
          end
        end
      end
    end
  end

  form do |f|
    f.inputs :content
    
    f.inputs do
      f.has_many :sub_reasons do |sr|
        sr.inputs :content
      end
    end
    f.actions
  end
end
