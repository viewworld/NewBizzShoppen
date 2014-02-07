class AddRequestedDuringUpgradeToMemberToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :requested_during_upgrade_to_member, :boolean, :default => false
  end

  def self.down
    remove_column :leads, :requested_during_upgrade_to_member
  end
end
