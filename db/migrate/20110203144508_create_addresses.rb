class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :zip_code
      t.integer :country_id
      t.string :company_registration_number
      t.string :cvr_ean_number
      t.string :addressable_type
      t.integer :addressable_id
      t.timestamps
    end
    User.all.each do |user|
      user.create_address(
          :first_name => user.first_name,
          :last_name => user.last_name,
          :address_line_1 => user.street,
          :address_line_2 => user.city,
          :address_line_3 => user.county,
          :zip_code => user.zip_code,
          :country_id => user.country
      )
    end
    remove_columns :users, :street, :city, :zip_code, :county, :country, :first_name, :last_name
    remove_columns :bank_accounts, :bank_address, :country_id
  end

  def self.down
    drop_table :addresses
  end
end
