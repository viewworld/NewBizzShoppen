class AddLeadCategoryIdToDeals < ActiveRecord::Migration
  def self.up
    add_column :leads, :lead_category_id, :integer
  end

  def self.down
    remove_column :leads, :lead_category_id
  end
end
