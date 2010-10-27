class AddPublishedToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :published, :boolean, :default => false
  end

  def self.down
    remove_column :leads, :published
  end
end
