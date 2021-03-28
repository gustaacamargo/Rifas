class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :photo, :text, null: true
    add_column :users, :admin, :boolean, default: false
  end
end
