class AddFieldsToCampaignsResults < ActiveRecord::Migration
  def self.up
    add_column :campaigns_results, :is_dynamic_value, :boolean, :default => false
    ActiveRecord::Migration.execute "UPDATE campaigns_results SET is_dynamic_value = 'f' WHERE is_dynamic_value IS NULL"
  end

  def self.down
  end
end
