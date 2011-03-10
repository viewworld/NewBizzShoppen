class AddBuyoutEnabledToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :buyout_enabled, :boolean, :default => true
  end

  def self.down
    remove_column :categories, :buyout_enabled
  end
end
