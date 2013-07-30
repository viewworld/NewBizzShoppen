class AddImportContactsFromListsToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :import_contacts_from_lists, :boolean, :default => false
    execute "UPDATE campaigns SET import_contacts_from_lists = 'f' WHERE import_contacts_from_lists IS NULL"
  end

  def self.down
    remove_column :campaigns, :import_contacts_from_lists
  end
end
