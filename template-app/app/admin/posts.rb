ActiveAdmin.register BxBlockPosts::Post, as: "Posts" do
  menu label: "Posts", priority: 5
  # menu true
  config.breadcrumb = false
  actions :all, :except => [:new, :edit]

  filter :created_at
  filter :updated_at
  filter :owner_id
  filter :nft_name
  filter :account, :collection => AccountBlock::Account.pluck(:email, :id), :as => :select
  
  index :title => @page_title do
    selectable_column
    id_column
    column 'Account' do |acc|
      link_to AccountBlock::Account.find(acc.account_id).email, admin_account_path(acc.account_id)
    end
    # column :name
    column :description
    column :nft_name
    column :owner_id
    column :image do |a|
      link_to(image_tag(a.image_url, :alt =>  "alt text", width: 50, height: 50), a.image_url, :target => :blank) if a.image_url.present?
    end
    column :animation_url do |a|
      link_to("Animation", a.animation_url, :target => :blank) if a.animation_url.present?
    end
    column :number_of_likes do |post|  
      post.likes.count 
    end
    column :number_of_comments do |post|  
      post.comments.count 
    end
    column :virality_score
    
    actions
  end 

  show do
    tabs do
      tab "Post" do
        attributes_table_for posts do
          row :id
          # row :name
          row :description
          row :nft_name
          row :nft_description
          row :owner_id
          row :token_id
          row :usd_amount
          row :eth_amount
          row :account_id do |acc|
            link_to AccountBlock::Account.find(acc.account_id).email, admin_account_path(acc.account_id)
          end
          row :image do |a|
            link_to(image_tag(a.image_url, :alt =>  "alt text", width: 50, height: 50), a.image_url, :target => :blank) if a.image_url.present?
          end
          row :image_preview_url
          row :image_thumbnail_url
          row :image_original_url
          row :animation_url do |a|
            link_to("Animation", a.animation_url, :target => :blank) if a.animation_url.present?
          end
          row :animation_original_url
          row :external_link
          row :created_at
          row :updated_at
          row :number_of_likes do |post|  
            post.likes.count 
          end
          row :number_of_comments do |post|  
            post.comments.count 
          end
          row :virality_score
        end
      end

      tab "Likes" do
        resource.likes.order("created_at DESC").each_with_index do |like, index|
          panel "Like #{index + 1}" do
            attributes_table_for like do
              # row (:wallet_type) {wallet.wallet_type}
              # row (:comment) {comment.comment}
              row (:account_id) do
                link_to AccountBlock::Account.find(like.like_by_id).email, admin_account_path(like.like_by_id)
              end
              row (:created_at) {like.created_at}
            end
          end
        end
      end

      tab "Comments" do
        resource.comments.where(comment_id: nil).order("created_at DESC").each_with_index do |comment, index|
          panel "Comment #{index + 1}" do
            attributes_table_for comment do
              row (:id) {comment.id}
              row (:text) {comment.comment}
              # row (:comment_id) {comment.comment_id}
              row (:account_id) do
                link_to AccountBlock::Account.find(comment.account_id).email, admin_account_path(comment.account_id)
              end
              row (:created_at) {comment.created_at}
              comment.replies.order("created_at DESC").each_with_index do |reply, index|
                panel "Reply #{index + 1}" do
                  attributes_table_for reply do
                    row (:id) {reply.id}
                    row (:text) {reply.comment}
                    # row (:comment_id) {reply.comment_id}
                    row (:account_id) do
                      link_to AccountBlock::Account.find(reply.account_id).email, admin_account_path(reply.account_id)
                    end
                    row (:created_at) {reply.created_at}
                  end
                end
              end
            end
          end
        end
      end

      tab "Reported by" do
        resource.report_posts.order("created_at DESC").each_with_index do |rp, index|
          panel "#{index + 1}" do
            attributes_table_for rp do
              row (:id) {rp.id}
              row (:account_id) do
                link_to AccountBlock::Account.find(rp.account_id).email, admin_account_path(rp.account_id)
              end
              row :report_reason_id do 
                link_to BxBlockContentflag::ReportReason.find(rp.report_reason_id).content, admin_report_reason_path(rp.report_reason_id)
              end
              row (:created_at) {rp.created_at}
            end
          end
        end
      end
    end
  end
end
