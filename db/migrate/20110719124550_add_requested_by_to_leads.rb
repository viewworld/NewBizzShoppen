class AddRequestedByToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :requested_by, :integer
    add_column :leads, :deal_id, :integer
  end

  def self.down
    remove_column :leads, :requested_by
    remove_column :leads, :deal_id
  end
end
