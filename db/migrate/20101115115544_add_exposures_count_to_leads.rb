class AddExposuresCountToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :exposures_count, :integer, :default => 0
  end

  def self.down
    remove_column :leads, :exposures_count
  end
end
