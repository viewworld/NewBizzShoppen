class AddRatingToLeadPurchases < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :rating_level, :integer
    add_column :lead_purchases, :rating_reason, :text
  end

  def self.down
    remove_column :lead_purchases, :rating_level
    remove_column :lead_purchases, :rating_reason
  end
end
