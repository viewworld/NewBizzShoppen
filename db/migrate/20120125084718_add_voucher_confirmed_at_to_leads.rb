class AddVoucherConfirmedAtToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :voucher_confirmed_at, :datetime, :default => nil
    add_column :leads, :voucher_cancelled_at, :datetime, :default => nil
  end

  def self.down
    remove_column :leads, :voucher_confirmed_at
    remove_column :leads, :voucher_cancelled_at
  end
end
