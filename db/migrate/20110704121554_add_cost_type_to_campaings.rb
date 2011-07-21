class AddCostTypeToCampaings < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :cost_type, :integer
    add_column :campaigns, :fixed_cost_value, :float
    add_column :campaigns, :euro_fixed_cost_value, :float

    ActiveRecord::Migration.execute "UPDATE campaigns SET cost_type = 3 WHERE cost_type IS NULL"
  end

  def self.down
    remove_column :campaigns, :cost_type
    remove_column :campaigns, :fixed_cost_value
    remove_column :campaigns, :euro_fixed_cost_value
  end
end
