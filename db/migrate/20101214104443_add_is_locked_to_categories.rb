class AddIsLockedToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :is_locked, :boolean, :default => false
  end

  def self.down
    remove_column :categories, :is_locked
  end
end
