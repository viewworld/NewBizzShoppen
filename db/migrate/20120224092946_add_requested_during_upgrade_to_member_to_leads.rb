class AddRequestedDuringUpgradeToMemberToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :requested_during_upgrade_to_member, :boolean, :default => false
    ActiveRecord::Migration.execute "UPDATE leads SET requested_during_upgrade_to_member = 'f' WHERE requested_during_upgrade_to_member is NULL"
  end

  def self.down
    remove_column :leads, :requested_during_upgrade_to_member
  end
end
