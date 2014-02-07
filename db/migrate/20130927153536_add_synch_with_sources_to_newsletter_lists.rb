class AddSynchWithSourcesToNewsletterLists < ActiveRecord::Migration
  def self.up
    add_column :newsletter_lists, :synch_with_sources, :boolean, :default => true
    add_column :leads, :newsletter_list_id, :integer
    add_column :leads, :newsletter_list_subscriber_id, :integer
  end

  def self.down
    remove_column :newsletter_lists, :synch_with_sources
    remove_column :leads, :newsletter_list_id
    remove_column :leads, :newsletter_list_subscriber_id
  end
end
