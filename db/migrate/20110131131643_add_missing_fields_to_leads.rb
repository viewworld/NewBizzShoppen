class AddMissingFieldsToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :company_phone_number, :string
    add_column :leads, :company_ean_number, :string
    add_column :leads, :company_website, :string
    add_column :leads, :direct_phone_number, :string
    add_column :leads, :is_international, :boolean, :default => true
  end

  def self.down
    remove_column :leads, :company_phone_number
    remove_column :leads, :company_ean_number
    remove_column :leads, :company_website
    remove_column :leads, :direct_phone_number
    remove_column :leads, :is_international
  end
end