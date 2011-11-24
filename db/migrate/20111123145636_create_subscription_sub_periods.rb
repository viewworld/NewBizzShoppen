class CreateSubscriptionSubPeriods < ActiveRecord::Migration
  def self.up
    create_table :subscription_sub_periods do |t|
      t.integer :subscription_id
      t.date :start_date
      t.date :end_date
      t.date :billing_date
      t.decimal :billing_price, :precision => 10, :scale => 2
      t.decimal :euro_billing_price, :precision => 10, :scale => 2
      t.integer :paypal_retries, :default => 0
      t.boolean :paypal_paid_auto, :default => false
      t.boolean :paypal_paid_manual, :default => false
      t.text :paypal_payment_id
      t.integer :invoice_id
      t.integer :currency_id
      t.timestamps
    end
  end

  def self.down
    drop_table :subscription_sub_periods
  end
end
