class AddPhoneTypeToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :phone_type_id, :integer
    execute "UPDATE users SET phone_type_id = 1 WHERE softphone_server_id IS NOT NULL"
  end

  def self.down
    remove_column :users, :phone_type_id
  end
end
