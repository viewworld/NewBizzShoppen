class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :subscription_plan_id
      t.string :name
      t.date :start_date
      t.date :end_date
      t.date :billing_date
      t.datetime :invoiced_at
      t.datetime :cancelled_at
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
      t.integer :position, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
