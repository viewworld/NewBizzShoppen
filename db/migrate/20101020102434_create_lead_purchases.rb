class CreateLeadPurchases < ActiveRecord::Migration
  def self.up
    create_table :lead_purchases do |t|
      t.integer :lead_id
      t.integer :owner_id
      t.integer :assignee_id
      t.boolean :paid, :default => false
      t.boolean :accessible, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :lead_purchases
  end
end
