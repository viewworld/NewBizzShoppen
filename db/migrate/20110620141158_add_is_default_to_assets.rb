class AddIsDefaultToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :is_default, :boolean, :default => false
    ActiveRecord::Migration.execute "UPDATE assets SET is_default = 'f' WHERE is_default IS NULL"
  end

  def self.down
    remove_column :assets, :is_default
  end
end
