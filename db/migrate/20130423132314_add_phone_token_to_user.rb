class AddPhoneTokenToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :phone_token, :string
  end

  def self.down
    remove_column :users, :phone_token
  end
end
