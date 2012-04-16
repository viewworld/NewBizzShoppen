class AddIsArchivedToResults < ActiveRecord::Migration
  def self.up
    add_column :results, :is_archived, :boolean, :default => false
    ActiveRecord::Migration.execute("UPDATE results SET is_archived = 'f' WHERE is_archived is NULL")
  end

  def self.down
    remove_column :results, :is_archived
  end
end
