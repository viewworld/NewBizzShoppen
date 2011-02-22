class AddCompanyFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :company_name, :string
    add_column :users, :company_registration_number, :string
    add_column :users, :company_ean_number, :string
  end

  def self.down
    remove_column :users, :company_name, :string
    remove_column :users, :company_registration_number, :string
    remove_column :users, :company_ean_number, :string
  end
end
