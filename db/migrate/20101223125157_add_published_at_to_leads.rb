class AddPublishedAtToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :published_at, :datetime
  end

  def self.down
    remove_column :leads, :published_at
  end
end
