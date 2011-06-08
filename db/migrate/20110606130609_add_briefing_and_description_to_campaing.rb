class AddBriefingAndDescriptionToCampaing < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :description, :text
    add_column :campaigns, :briefing, :text
  end

  def self.down
    remove_column :campaigns, :description
    remove_column :campaigns, :briefing
  end
end
