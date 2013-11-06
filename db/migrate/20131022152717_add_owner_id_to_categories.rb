class AddOwnerIdToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :owner_id, :integer
    add_index :categories, :owner_id
  end

  def self.down
    remove_index :categories, :owner_id
    remove_column :categories, :owner_id
  end
end
