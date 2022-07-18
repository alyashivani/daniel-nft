class CreateSearchHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :search_histories do |t|
      t.references :account
      t.string :search_params

      t.timestamps
    end
  end
end
