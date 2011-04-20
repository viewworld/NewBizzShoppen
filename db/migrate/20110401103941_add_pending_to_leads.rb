class AddPendingToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :pending, :boolean, :default => false
  end

  def self.down
    remove_column :leads, :pending
  end
end
