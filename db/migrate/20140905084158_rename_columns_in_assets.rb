class RenameColumnsInAssets < ActiveRecord::Migration
  def change
    rename_column :assets, :asset_file_name, :data_file_name
    rename_column :assets, :asset_content_type, :data_content_type
    rename_column :assets, :asset_file_size, :data_file_size
  end
end
