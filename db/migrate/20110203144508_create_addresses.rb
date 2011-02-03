class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :zip_code
      t.string :county
      t.integer :country_id
      t.string :addressable_type
      t.integer :addressable_id
      t.timestamps
    end
    User.all.each do |user|
      user.create_address(
          :street => user.street,
          :city => user.city,
          :zip_code => user.zip_code,
          :county => user.county,
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
