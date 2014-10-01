class DropSipFieldsFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :sip_username
    remove_column :users, :sip_password
    remove_column :users, :softphone_server_id
  end

  def self.down
    add_column :users, :sip_username, :string
    add_column :users, :sip_password, :string
    add_column :users, :softphone_server_id, :integer
  end
end
