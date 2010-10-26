class AddNestedSetFieldsToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :parent_id, :integer
    add_column :categories, :lft, :integer
    add_column :categories, :rgt, :integer
    add_column :categories, :depth, :integer
  end

  def self.down
    remove_column :categories, :parent_id
    remove_column :categories, :lft
    remove_column :categories, :rgt
    remove_column :categories, :depth
  end
end