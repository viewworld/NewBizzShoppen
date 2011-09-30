class AddDealCodeToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :deal_code, :string
  end

  def self.down
    remove_column :leads, :deal_code
  end
end
