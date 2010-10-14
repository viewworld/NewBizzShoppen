class AddFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :screen_name, :string
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :zip_code, :string
    add_column :users, :county, :string
    add_column :users, :country, :integer
    add_column :users, :newsletter_on, :boolean
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :phone
    remove_column :users, :screen_name
    remove_column :users, :street
    remove_column :users, :city
    remove_column :users, :zip_code
    remove_column :users, :county
    remove_column :users, :country
    remove_column :users, :newsletter_on
  end
end
