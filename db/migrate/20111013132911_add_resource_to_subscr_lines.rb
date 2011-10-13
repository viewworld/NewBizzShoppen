class AddResourceToSubscrLines < ActiveRecord::Migration
  def self.up
    add_column :subscription_plan_lines, :resource_id, :integer
    add_column :subscription_plan_lines, :resource_type, :string
    remove_column :subscription_plan_lines, :subscription_plan_id
  end

  def self.down
    remove_column :subscription_plan_lines, :resource_id
    remove_column :subscription_plan_lines, :resource_type
    add_column :subscription_plan_lines, :subscription_plan_id, :integer
  end
end
