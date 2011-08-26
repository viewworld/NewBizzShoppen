class AddDealAdminToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :deal_admin_email, :string
  end

  def self.down
    remove_column :leads, :deal_admin_email
  end
end
