class AddCategoryIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :category_id, :integer
  end

  def self.down
    remove_column :users, :category_id
  end
end
