class AddExtraFieldsToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :subject, :string
    add_column :contacts, :message, :text
  end
end
