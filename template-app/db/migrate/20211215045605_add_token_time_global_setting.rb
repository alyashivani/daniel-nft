class AddTokenTimeGlobalSetting < ActiveRecord::Migration[6.0]
  def change
    add_column :global_settings, :token_valid_days, :integer
  end
end
