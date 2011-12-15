class AddEnabledFromToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :enabled_from, :date
    Deal.update_all("voucher_enabled = false")
    Deal.update_all("voucher_until_type = 0")
    Deal.update_all("voucher_number_of_weeks = 1")
    Deal.update_all("voucher_max_number = 1")
    Deal.all.each{|d| d.update_attribute(:deal_unique_id, d.generate_deal_unique_id)}
  end

  def self.down
    remove_column :leads, :enabled_from
  end
end
