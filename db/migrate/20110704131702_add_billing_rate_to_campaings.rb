class AddBillingRateToCampaings < ActiveRecord::Migration
  def self.up
    add_column :users, :billing_rate, :float
    add_column :users, :euro_billing_rate, :float
    add_column :users, :currency_id, :integer
  end

  def self.down
    remove_column :users, :billing_rate
    remove_column :users, :euro_billing_rate
    remove_column :users, :currency_id
  end
end
