class AddTestAccountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :test_account, :boolean, :default => false
  end

  def self.down
    remove_column :users, :test_account
  end
end
