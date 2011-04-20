class AddPositionToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :position, :integer
  end

  def self.down
    remove_column :leads, :position
  end
end
