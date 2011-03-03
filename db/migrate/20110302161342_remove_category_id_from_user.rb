class RemoveCategoryIdFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :category_id
  end

  def self.down
    add_column :users, :category_id, :integer
  end
end
