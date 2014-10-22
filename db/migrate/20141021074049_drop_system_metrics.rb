class DropSystemMetrics < ActiveRecord::Migration
  def self.up
    drop_table :system_metrics
  end

  def self.down
    create_table :system_metrics, force: true do |t|
      t.column :name, :string, null: false
      t.column :started_at, :datetime, null: false
      t.column :transaction_id, :string
      t.column :payload, :text
      t.column :duration, :float, null: false
      t.column :exclusive_duration, :float, null: false
      t.column :request_id, :integer
      t.column :parent_id, :integer
      t.column :action, :string, null: false
      t.column :category, :string, null: false
    end
  end
end
