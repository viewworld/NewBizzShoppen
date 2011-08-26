class AddDealCategoryIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :deal_category_id, :integer
  end

  def self.down
    remove_column :users, :deal_category_id
  end
end
