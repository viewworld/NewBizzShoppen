class AddFieldsToCampaignsResults < ActiveRecord::Migration
  def self.up
    add_column :campaigns_results, :is_dynamic_value, :boolean, :default => false
  end

  def self.down
  end
end
