class AddIsArchivedToResults < ActiveRecord::Migration
  def self.up
    add_column :results, :is_archived, :boolean, :default => false
  end

  def self.down
    remove_column :results, :is_archived
  end
end
