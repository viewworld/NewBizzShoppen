class AddIsBlockedToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :is_blocked, :boolean, :default => false
  end

  def self.down
    remove_column :comments, :is_blocked
  end
end
