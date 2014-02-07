class AddSettingsToCampaignsReports < ActiveRecord::Migration
  def self.up
    add_column :campaigns_results, :settings, :text
    add_column :results, :settings, :text
  end

  def self.down
    remove_column :campaigns_results, :settings
    remove_column :results, :settings
  end
end
