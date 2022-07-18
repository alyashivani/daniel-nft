class CreateReportPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :report_posts do |t|
      t.references :account, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.references :report_reason, null: false, foreign_key: true

      t.timestamps
    end
  end
end
