class AddResponseDeadlineToLeadPurchases < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :response_deadline, :date
  end

  def self.down
    remove_column :lead_purchases, :response_deadline
  end
end
