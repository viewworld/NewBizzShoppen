class CreateSubscriptionPlans < ActiveRecord::Migration
  def self.up
    create_table :subscription_plans do |t|
      t.string :name
      t.integer :roles_mask
      t.integer :billing_cycle
      t.integer :lockup_period
      t.integer :billing_period
      t.integer :free_period
      t.integer :currency_id
      t.integer :seller_id
      t.boolean :is_active, :default => true
      t.boolean :can_be_upgraded, :default => true
      t.boolean :can_be_downgraded, :default => true
      t.boolean :team_buyer, :default => false
      t.boolean :big_buyer, :default => false
      t.boolean :deal_maker, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :subscription_plans
  end
end
