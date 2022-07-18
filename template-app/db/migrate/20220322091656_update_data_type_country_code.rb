class UpdateDataTypeCountryCode < ActiveRecord::Migration[6.0]
  def change
    change_column :profiles, :country_code, :string
  end
end
