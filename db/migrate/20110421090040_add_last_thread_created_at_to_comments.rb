class AddLastThreadCreatedAtToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :last_thread_created_at, :datetime
  end

  def self.down
    remove_column :comments, :last_thread_created_at
  end
end
