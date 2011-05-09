class AddIsBlockedToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :is_blocked, :boolean, :default => false
    execute "UPDATE comments SET is_blocked = FALSE WHERE is_blocked IS NULL"
  end

  def self.down
    remove_column :comments, :is_blocked
  end
end
