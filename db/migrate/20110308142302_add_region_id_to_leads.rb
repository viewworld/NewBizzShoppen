class AddRegionIdToLeads < ActiveRecord::Migration
  def self.up
    remove_column :leads, :county
    add_column :leads, :region_id, :integer
  end

  def self.down
    add_column :leads, :county, :string
    remove_column :leads, :region_id
  end
end
