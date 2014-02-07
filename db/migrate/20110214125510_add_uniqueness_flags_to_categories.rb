class AddUniquenessFlagsToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :is_customer_unique, :boolean, :default => false
    add_column :categories, :is_agent_unique, :boolean, :default => false
  end

  def self.down
    remove_column :categories, :is_customer_unique
    remove_column :categories, :is_agent_unique
  end
end
