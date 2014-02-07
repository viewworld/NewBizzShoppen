class AddUpgradeContactsToLeadsToSurveys < ActiveRecord::Migration
  def self.up
    add_column :surveys, :upgrade_contacts_to_leads, :boolean, :default => false
    add_column :surveys, :lead_creator_id, :integer, :default => nil
    add_column :leads, :upgraded_from_survey_id, :integer, :default => nil
  end

  def self.down
    remove_column :surveys, :upgrade_contacts_to_leads
    remove_column :surveys, :lead_creator_id
    remove_column :leads, :upgraded_from_survey_id
  end
end
