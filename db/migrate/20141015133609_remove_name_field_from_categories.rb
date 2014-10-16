class RemoveNameFieldFromCategories < ActiveRecord::Migration
  def self.up
    remove_column :categories, :name
  end

  def self.down
    add_column :categories, :name, :string
  end
end
