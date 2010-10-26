class AddRequestedByToLeadPurchase < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :requested_by, :integer
  end

  def self.down
    remove_column :lead_purchases, :requested_by
  end
end
