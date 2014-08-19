class AddNotFieldToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :note, :text
  end

  def self.down
    remove_column :users, :note, :text
  end
end
