class AddFeaturedToLead < ActiveRecord::Migration
  def self.up
    add_column :leads, :featured, :boolean
  end

  def self.down
    remove_column :leads, :features
  end
end
