class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :zip_code
      t.integer :country_id
      t.string :addressable_type
      t.integer :addressable_id
      t.timestamps
    end
    User.all.each do |user|
      user.with_role.create_address(
          :address_line_1 => user.street,
          :address_line_2 => user.city,
          :address_line_3 => user.county,
          :zip_code => user.zip_code,
          :country_id => user.country
      )
    end
    remove_columns :users, :street, :city, :zip_code, :county, :country
    remove_columns :bank_accounts, :bank_address, :country_id
  end

  def self.down
    drop_table :addresses
  end
end
