class AddInTrayToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :in_tray, :boolean
  end

  def self.down
    remove_column :categories, :in_tray
  end
end
