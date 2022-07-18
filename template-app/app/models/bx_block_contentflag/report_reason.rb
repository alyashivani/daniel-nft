module BxBlockContentflag
  class ReportReason < BxBlockContentflag::ApplicationRecord
    self.table_name = :report_reasons

    has_many :report_posts, class_name: "BxBlockContentflag::ReportPost"
    has_many :sub_reasons, foreign_key: :report_reason_id, class_name: "BxBlockContentflag::ReportReason", dependent: :destroy
    accepts_nested_attributes_for :sub_reasons
  end
end
