class AddCmPasswordToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :cm_username, :string
    add_column :users, :cm_password, :string
  end

  def self.down
    remove_column :users, :cm_username
    remove_column :users, :cm_password
  end
end
