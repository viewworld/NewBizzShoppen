class AddTestAccountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :test_account, :boolean, :default => false
    execute "UPDATE users SET test_account = FALSE"
  end

  def self.down
    remove_column :users, :test_account
  end
end
