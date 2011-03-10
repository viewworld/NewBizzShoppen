class AddPurchasedLeadsCounterToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :leads_purchased_counter, :integer
  end

  def self.down
    remove_column :users, :leads_purchased_counter
  end
end
