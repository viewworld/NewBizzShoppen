class AddSubaccountCounterCache < ActiveRecord::Migration
  def self.up
    add_column :users, :subaccounts_counter, :integer, :default => 0
  end

  def self.down
    remove_column :users, :subaccounts_counter
  end
end
