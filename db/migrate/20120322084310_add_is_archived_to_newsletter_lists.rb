class AddIsArchivedToNewsletterLists < ActiveRecord::Migration
  def self.up
    add_column :newsletter_lists, :is_archived, :boolean, :default => false

    ActiveRecord::Migration.execute("UPDATE newsletter_lists SET is_archived = 'f' WHERE is_archived IS NULL")
  end

  def self.down
  end
end
