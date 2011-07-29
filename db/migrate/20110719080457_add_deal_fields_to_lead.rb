class AddDealFieldsToLead < ActiveRecord::Migration
  def self.up
    add_column :leads, :fine_print, :text
    add_column :leads, :company_description, :text
    add_column :leads, :start_date, :date
    add_column :leads, :end_date, :date
  end

  def self.down
    remove_column :leads, :end_date
    remove_column :leads, :start_date
    remove_column :leads, :company_description
    remove_column :leads, :fine_print
  end
end
