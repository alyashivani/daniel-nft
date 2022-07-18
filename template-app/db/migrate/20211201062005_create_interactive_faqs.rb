class CreateInteractiveFaqs < ActiveRecord::Migration[6.0]
  def change
    create_table :interactive_faqs do |t|
      t.string :question
      t.text :answer

      t.timestamps
    end
  end
end
