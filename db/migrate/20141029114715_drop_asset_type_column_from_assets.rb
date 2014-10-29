class DropAssetTypeColumnFromAssets < ActiveRecord::Migration
  def up
    remove_column :assets, :asset_type
  end

  def down
    add_column :assets, :asset_type, :string
    Asset.scoped.update_all('asset_type = type')
  end
end
