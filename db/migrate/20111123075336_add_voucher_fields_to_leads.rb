class AddVoucherFieldsToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :deal_unique_id, :string
    add_column :leads, :voucher_enabled, :boolean, :default => false
    add_column :leads, :voucher_until_type, :integer, :default => 0
    add_column :leads, :voucher_number_of_weeks, :integer, :default => 1
    add_column :leads, :voucher_end_date, :date
    add_column :leads, :voucher_max_number, :integer, :default => 1
    add_column :leads, :voucher_how_to_redeem, :text
    Deal.update_all("voucher_enabled = false")
    Deal.update_all("voucher_until_type = 0")
    Deal.update_all("voucher_number_of_weeks = 1")
    Deal.update_all("voucher_max_number = 1")
    Deal.all.each{|d| d.update_attribute(:deal_unique_id, d.generate_deal_unique_id)}
  end

  def self.down
    remove_column :leads, :deal_unique_id
    remove_column :leads, :voucher_enabled
    remove_column :leads, :voucher_until_type
    remove_column :leads, :voucher_number_of_weeks
    remove_column :leads, :voucher_end_date
    remove_column :leads, :voucher_max_number
    remove_column :leads, :voucher_how_to_redeem
  end
end
