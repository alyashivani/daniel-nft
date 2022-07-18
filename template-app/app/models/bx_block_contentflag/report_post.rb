module BxBlockContentflag
  class ReportPost < BxBlockContentflag::ApplicationRecord
    self.table_name = :report_posts

    belongs_to :post, class_name: 'BxBlockPosts::Post'
  end
end