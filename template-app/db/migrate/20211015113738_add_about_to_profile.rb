class AddAboutToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :about, :string
    add_column :profiles, :date_of_birth, :date
    add_column :profiles, :state, :string
    add_column :profiles, :mobile_number, :string
  end
end
