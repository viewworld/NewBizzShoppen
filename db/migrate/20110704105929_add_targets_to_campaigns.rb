class AddTargetsToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :finished_contacts_per_hour, :float
    add_column :campaigns, :production_value_per_hour, :float
    add_column :campaigns, :euro_production_value_per_hour, :float
    add_column :campaigns, :success_rate, :float
  end

  def self.down
    remove_column :campaigns, :finished_contacts_per_hour
    remove_column :campaigns, :production_value_per_hour
    remove_column :campaigns, :success_rate
  end
end
