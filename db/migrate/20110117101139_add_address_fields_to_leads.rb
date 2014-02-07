class AddAddressFieldsToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :address_line_1, :string
    add_column :leads, :address_line_2, :string
    add_column :leads, :address_line_3, :string
    add_column :leads, :city, :string
    add_column :leads, :zip_code, :string
    add_column :leads, :county, :string
    remove_column :leads, :address
  end

  def self.down
    remove_column :leads, :address_line_1
    remove_column :leads, :address_line_2
    remove_column :leads, :address_line_3
    remove_column :leads, :city
    remove_column :leads, :zip_code
    remove_column :leads, :county
    add_column :leads, :address, :text
  end
end
