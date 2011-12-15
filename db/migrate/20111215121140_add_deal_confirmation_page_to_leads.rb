class AddDealConfirmationPageToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :deal_confirmation_page, :text
  end

  def self.down
    remove_column :leads, :deal_confirmation_page
  end
end
