class AddSynchWithSourcesToNewsletterLists < ActiveRecord::Migration
  def self.up
    add_column :newsletter_lists, :synch_with_sources, :boolean, :default => true
    add_column :leads, :newsletter_list_id, :integer
    execute "UPDATE newsletter_lists SET synch_with_sources = 't' WHERE synch_with_sources IS NULL"
  end

  def self.down
    remove_column :newsletter_lists, :synch_with_sources
    remove_column :leads, :newsletter_list_id
  end
end
