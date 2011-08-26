class AddDealAverageRatingToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :deal_average_rating, :decimal, :default => 0, :precision => 6, :scale => 2

  end

  def self.down
    remove_column :leads, :deal_average_rating
  end
end
