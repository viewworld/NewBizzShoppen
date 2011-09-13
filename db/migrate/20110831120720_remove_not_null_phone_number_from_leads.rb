class RemoveNotNullPhoneNumberFromLeads < ActiveRecord::Migration
  def self.up
    change_column :leads, :phone_number, :string, :null => true
    change_column :leads, :company_name, :string, :null => true
  end

  def self.down
    change_column :leads, :phone_number, :string, :null => false
    change_column :leads, :company_name, :string, :null => false
  end
end
