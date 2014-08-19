class AddPayoutsToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :payout, :decimal
    add_column :leads, :euro_payout, :decimal
    add_column :leads, :payout_currency_id, :integer
  end

  def self.down
    remove_column :leads, :payout
    remove_column :leads, :euro_payout
    remove_column :leads, :payout_currency_id
  end
end
