class RemoveCompanyRegistrationNumberFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :company_registration_number
  end

  def self.down
    add_column :users, :company_registration_number, :string
  end
end
