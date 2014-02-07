class AddGroupDealFieldsToLead < ActiveRecord::Migration
  def self.up
    add_column :leads, :group_deal, :boolean, :default => false
    add_column :leads, :discounted_price, :decimal, :precision => 10, :scale => 2
    add_column :leads, :social_media_description, :text
    add_column :leads, :created_leads, :integer, :default => 0
  end

  def self.down
    remove_column :leads, :social_media_description
    remove_column :leads, :discounted_price
    remove_column :leads, :group_deal
    remove_column :leads, :created_leads
  end
end