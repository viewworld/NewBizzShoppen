class CreatePaymentTransactions < ActiveRecord::Migration
  def self.up
    create_table :payment_transactions do |t|
      t.integer :invoice_id
      t.integer :payment_notification_id
      t.string :type
      t.datetime :paid_at
      t.decimal :amount, :precision => 10, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :payment_transactions
  end
end
