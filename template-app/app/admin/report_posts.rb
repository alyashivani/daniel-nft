ActiveAdmin.register BxBlockContentflag::ReportPost, as: "ReportPost" do
  menu label: "Report Posts", priority: 9
  config.breadcrumb = false
  actions :all, :except => [:new, :edit]

  filter :created_at
  filter :updated_at
  filter :post_id, :collection => BxBlockPosts::Post.pluck(:nft_name, :id), :as => :select
  filter :report_reason_id, :collection => BxBlockContentflag::ReportReason.pluck(:content, :id), :as => :select
  filter :account_id, :collection => AccountBlock::Account.pluck(:email, :id), :as => :select

  action_item :delete, :only => :show do
    link_to "Delete post", "/admin/posts/#{report_post.post_id}", :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), class: "member_link delete_link"
  end

  index :title => @page_title do
    selectable_column
    id_column
    column "Reported by" do |report_post|
      link_to AccountBlock::Account.find(report_post.account_id).email, admin_account_path(report_post.account_id)
    end
    column :post_id do |report_post|
      link_to BxBlockPosts::Post.find(report_post.post_id).nft_name, admin_post_path(report_post.post_id)
    end
    column :report_reason_id do |report_post|
      link_to BxBlockContentflag::ReportReason.find(report_post.report_reason_id).content, admin_report_reason_path(report_post.report_reason_id)
    end
    
    actions do |report_post|
      item "Delete post", "/admin/posts/#{report_post.post_id}", :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), class: "member_link delete_link"
    end
  end 

  show do
    attributes_table do
      row "Reported by" do |report_post|
        link_to AccountBlock::Account.find(report_post.account_id).email, admin_account_path(report_post.account_id) if report_post.account_id.present?
      end
      row :post_id do |report_post|
        link_to BxBlockPosts::Post.find(report_post.post_id).nft_name, admin_post_path(report_post.post_id)
      end
      row :report_reason_id do |report_post|
        link_to BxBlockContentflag::ReportReason.find(report_post.report_reason_id).content, admin_report_reason_path(report_post.report_reason_id)
      end
      row :created_at
      row :updated_at
    end
  end
end
