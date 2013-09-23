class CreateCampaignsNewsletterLists < ActiveRecord::Migration
  def self.up
    create_table :campaigns_newsletter_lists, :id => false do |t|
      t.integer :campaign_id
      t.integer :newsletter_list_id
    end

    add_column :campaigns, :import_contacts_from_lists_enabled, :boolean, :default => false
    execute "UPDATE campaigns SET import_contacts_from_lists_enabled = 'f' WHERE import_contacts_from_lists_enabled IS NULL"
  end

  def self.down
    drop_table :campaigns_newsletter_lists
    remove_column :campaigns, :import_contacts_from_lists_enabled
  end
end
