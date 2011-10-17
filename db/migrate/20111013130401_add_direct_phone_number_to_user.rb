class AddDirectPhoneNumberToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :direct_phone_number, :string
  end

  def self.down
    remove_column :users, :direct_phone_number
  end
end
