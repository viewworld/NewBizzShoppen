class AddEnabledFromToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :enabled_from, :date
  end

  def self.down
    remove_column :leads, :enabled_from
  end
end
