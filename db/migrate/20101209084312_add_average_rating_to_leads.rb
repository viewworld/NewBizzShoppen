class AddAverageRatingToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :average_rating, :integer, :default => -1
  end

  def self.down
    remove_column :leads, :average_rating
  end
end
