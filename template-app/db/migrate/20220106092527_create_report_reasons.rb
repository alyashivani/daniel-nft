class CreateReportReasons < ActiveRecord::Migration[6.0]
  def change
    create_table :report_reasons do |t|
      t.string :content
      t.integer :report_reason_id

      t.timestamps
    end
  end
end
