class AddBankInfoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :bank_name, :string
    add_column :users, :bank_address, :string
  end

  def self.down
    remove_column :users, :bank_name, :string
    remove_column :users, :bank_address, :string
  end
end
