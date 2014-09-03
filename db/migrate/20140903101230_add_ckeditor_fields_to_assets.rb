class AddCkeditorFieldsToAssets < ActiveRecord::Migration
  def change
    rename_column :assets, :resource_type, :assetable_type
    rename_column :assets, :resource_id, :assetable_id

    change_column :assets, :assetable_type, :string, index: true
    change_column :assets, :assetable_id, :integer, index: true

    add_column :assets, :width, :integer
    add_column :assets, :height, :integer
  end
end
