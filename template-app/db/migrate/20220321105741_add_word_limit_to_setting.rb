class AddWordLimitToSetting < ActiveRecord::Migration[6.0]
  def change
    add_column :settings, :post_word_limit, :integer
  end
end
