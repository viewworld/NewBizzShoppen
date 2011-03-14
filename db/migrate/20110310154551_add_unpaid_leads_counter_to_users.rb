class AddUnpaidLeadsCounterToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :unpaid_leads_counter, :integer
  end

  def self.down
    remove_column :users, :unpaid_leads_counter
  end
end
