class AddResourceIdToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :resource_type, :string
    add_column :assets, :resource_id, :integer
  end

  def self.down
    remove_column :assets, :resource_type
    remove_column :assets, :resource_id, :integer
  end
end
