class AddFieldsToDeals < ActiveRecord::Migration
  def self.up
    add_column :leads, :featured_description, :text
    add_column :leads, :short_featured_description, :text
  end

  def self.down
    remove_column :leads, :featured_description
    remove_column :leads, :short_featured_description
  end
end
