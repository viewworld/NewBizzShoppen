class RenameLeadNameToContactName < ActiveRecord::Migration
  def self.up
    rename_column :leads, :lead_name, :contact_name
  end

  def self.down
    rename_column :leads, :contact_name, :lead_name
  end
end
