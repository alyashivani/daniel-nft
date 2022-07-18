class AddCountryCodeToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :country_code, :integer
  end
end
