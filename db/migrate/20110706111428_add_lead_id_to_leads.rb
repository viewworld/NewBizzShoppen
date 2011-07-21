class AddLeadIdToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :lead_id, :integer
  end

  def self.down
    remove_column :leads, :lead_id
  end
end
