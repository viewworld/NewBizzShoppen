class AddIsArchivedToNewsletterLists < ActiveRecord::Migration
  def self.up
    add_column :newsletter_lists, :is_archived, :boolean, :default => false
  end

  def self.down
  end
end
