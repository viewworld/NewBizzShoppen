class AddCompletedToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :completed, :boolean, :default => false
  end

  def self.down
    remove_column :leads, :completed
  end
end
