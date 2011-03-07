class RemoveBankAddressFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :bank_address
  end

  def self.down
  end
end
