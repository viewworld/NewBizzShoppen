class CreateSubscriptionPlanLines < ActiveRecord::Migration
  def self.up
    create_table :subscription_plan_lines do |t|
      t.integer :subscription_plan_id
      t.string :name
      t.decimal :price, :precision => 10, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :subscription_plan_lines
  end
end
