class AddImportContactsFromListsToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :import_contacts_from_lists_enabled, :boolean, :default => false
    execute "UPDATE campaigns SET import_contacts_from_lists_enabled = 'f' WHERE import_contacts_from_lists_enabled IS NULL"
  end

  def self.down
    remove_column :campaigns, :import_contacts_from_lists_enabled
  end
end
