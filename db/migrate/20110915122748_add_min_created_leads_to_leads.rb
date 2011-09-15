class AddMinCreatedLeadsToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :min_created_leads, :integer, :default => 0
  end

  def self.down
    remove_column :leads, :min_created_leads
  end
end
