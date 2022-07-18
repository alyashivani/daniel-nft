module Dashboard
end

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end
    columns do
      column do
        panel "Total Users" do
          pie_chart AccountBlock::Account.group_by_month(:created_at).count, donut: true
        end
      end
      column do 
        panel "Trending posts" do 
          posts = BxBlockPosts::Post.where("virality_score > ?", 0).where.not(recent_update: nil).order("virality_score DESC", "recent_update DESC").limit(5)
          posts.each_with_index do |post, index|
            attributes_table_for "posts" do 
              row ("Post #{index + 1}") do 
                link_to post.nft_name, admin_post_path(post.id)
              end
            end
          end
        end
      end
    end
    columns do
      column do
        panel "Users" do
          attributes_table_for "users" do 
            row ("Registered Users") do
              usr_count = AccountBlock::Account.count
              para link_to("Total #{usr_count} Registered Users", admin_accounts_path)
            end
            row ("Active Users") do
              act_count = AccountBlock::Account.where('activated = ?', true).count
              para link_to("Total #{act_count} Active Users", admin_accounts_path)
            end
            row ("New Users in a Month") do 
              new_count = AccountBlock::Account.where("Date(created_at) between ? and ?", Date.today-1.month, Date.today).count
              para link_to("Total #{new_count} New Users", admin_accounts_path)
            end
            row ("New Users in a Week") do 
              new_count = AccountBlock::Account.where("Date(created_at) between ? and ?", Date.today-1.week, Date.today).count
              para link_to("Total #{new_count} New Users", admin_accounts_path)
            end
          end
        end
      end
      column do
        panel "Posts" do
          attributes_table_for "posts" do
            row ("Total Posts") do
              post_count = BxBlockPosts::Post.count
              para link_to("Total #{post_count} Posts", admin_posts_path)
            end
            row ("New Posts in a Month") do
              post_count = BxBlockPosts::Post.where("Date(created_at) between ? and ?", Date.today-1.month, Date.today).count
              para link_to("Total #{post_count} Posts", admin_posts_path)
            end
            row ("New Posts in a Week") do
              post_count = BxBlockPosts::Post.where("Date(created_at) between ? and ?", Date.today-1.week, Date.today).count
              para link_to("Total #{post_count} Posts", admin_posts_path)
            end
          end
        end
      end
      column do 
        panel "Likes" do 
          attributes_table_for "likes" do 
            row ("Total likes on posts") do 
              likes_count = BxBlockLike::Like.where(likeable_type: "BxBlockPosts::Post").count
              para link_to("Total #{likes_count} Likes", admin_posts_path)
            end
            row ("Total likes on posts in a month") do 
              likes_count = BxBlockLike::Like.where(likeable_type: "BxBlockPosts::Post").where("Date(created_at) between ? and ?", Date.today-1.month, Date.today).count
              para link_to("Total #{likes_count} Likes", admin_posts_path)
            end
            row ("Total likes on posts in a week") do 
              likes_count = BxBlockLike::Like.where(likeable_type: "BxBlockPosts::Post").where("Date(created_at) between ? and ?", Date.today-1.week, Date.today).count
              para link_to("Total #{likes_count} Likes", admin_posts_path)
            end
          end
        end
      end
    end 

    columns do 
      column do
        panel "New Users in a Month" do
          line_chart AccountBlock::Account.where("Date(created_at) between ? and ?", Date.today-1.month, Date.today).group_by_day(:created_at).count, xtitle: "Date", ytitle: "Count" 
        end
      end
      column do
        panel "New Users in a Week" do
          line_chart AccountBlock::Account.where("Date(created_at) between ? and ?", Date.today-1.week, Date.today).group_by_day(:created_at).count, xtitle: "Date", ytitle: "Count"
        end
      end
    end

    columns do
      column do
        panel "Total NFTs" do
          line_chart BxBlockCfmetamask::Nft.group_by_month(:created_at).count, xtitle: "Date", ytitle: "Count"
        end
      end
      column do
        panel "Total Wallets" do
          line_chart BxBlockCfmetamask::Wallet.group_by_month(:created_at).count, xtitle: "Date", ytitle: "Count"
        end
      end
    end

    # columns do
    #   column do
    #     panel "Total Likes" do
    #       line_chart BxBlockLike::Like.where(likeable_type: "BxBlockPosts::Post").group_by_month(:created_at).count, xtitle: "Date", ytitle: "Count"
    #     end
    #   end
    #   column do
    #     panel "Total Likes in a Month" do
    #       line_chart BxBlockLike::Like.where(likeable_type: "BxBlockPosts::Post").where("Date(created_at) between ? and ?", Date.today-1.month, Date.today).group_by_day(:created_at).count, xtitle: "Date", ytitle: "Count"
    #     end
    #   end
    #   column do
    #     panel "Total Likes in a Week" do
    #       line_chart BxBlockLike::Like.where(likeable_type: "BxBlockPosts::Post").where("Date(created_at) between ? and ?", Date.today-1.week, Date.today).group_by_day(:created_at).count, xtitle: "Date", ytitle: "Count"
    #     end
    #   end
    # end

    columns do
      column do
        panel "Wallets" do
          attributes_table_for "wallets" do
            row ("Total Wallets") do
              wallet_count = BxBlockCfmetamask::Wallet.count
              para link_to("Total #{wallet_count} Wallets", admin_wallets_path)
            end
            row ("New Wallets in a Month") do
              wallet_count = BxBlockCfmetamask::Wallet.where("Date(created_at) between ? and ?", Date.today-1.month, Date.today).count
              para link_to("Total #{wallet_count} Wallets", admin_wallets_path)
            end
            row ("New Wallets in a Week") do
              wallet_count = BxBlockCfmetamask::Wallet.where("Date(created_at) between ? and ?", Date.today-1.week, Date.today).count
              para link_to("Total #{wallet_count} Wallets", admin_wallets_path)
            end
          end
        end
      end
      
      column do
        panel "NFTs" do
          attributes_table_for "nfts" do
            row ("Total NFTs") do
              nft_count = BxBlockCfmetamask::Nft.count
              para link_to("Total #{nft_count} NFTs", admin_nfts_path)
            end
            row ("New NFTs in a Month") do
              nft_count = BxBlockCfmetamask::Nft.where("Date(created_at) between ? and ?", Date.today-1.month, Date.today).count
              para link_to("Total #{nft_count} NFTs", admin_nfts_path)
            end
            row ("New NFTs in a Week") do
              nft_count = BxBlockCfmetamask::Nft.where("Date(created_at) between ? and ?", Date.today-1.week, Date.today).count
              para link_to("Total #{nft_count} NFTs", admin_nfts_path)
            end
          end
        end
      end
      column do
        panel "Report Posts" do
          attributes_table_for "report posts" do
            row ("Total Report Posts") do
              report_count = BxBlockContentflag::ReportPost.count
              para link_to("Total #{report_count} Report Posts", admin_report_posts_path)
            end
            row ("Report Posts in a Month") do
              report_count = BxBlockContentflag::ReportPost.where("Date(created_at) between ? and ?", Date.today-1.month, Date.today).count
              para link_to("Total #{report_count} Report Posts", admin_report_posts_path)
            end
            row ("Report Posts in a Week") do
              report_count = BxBlockContentflag::ReportPost.where("Date(created_at) between ? and ?", Date.today-1.week, Date.today).count
              para link_to("Total #{report_count} Report Posts", admin_report_posts_path)
            end
          end
        end
      end
    end
  end 
end
