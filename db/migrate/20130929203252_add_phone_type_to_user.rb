class AddPhoneTypeToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :phone_type_id, :integer
  end

  def self.down
    remove_column :users, :phone_type_id
  end
end
