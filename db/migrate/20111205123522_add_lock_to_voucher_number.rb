class AddLockToVoucherNumber < ActiveRecord::Migration
  def self.up
    add_column :voucher_numbers, :lock_version, :integer, :default => 0
  end

  def self.down
    remove_column :voucher_numbers, :lock_version
  end
end
