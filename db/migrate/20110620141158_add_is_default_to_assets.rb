class AddIsDefaultToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :is_default, :boolean, :default => false
  end

  def self.down
    remove_column :assets, :is_default
  end
end
