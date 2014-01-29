class AddNewFieldsToLeadPurchases < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :decision_date, :date
    add_column :lead_purchases, :value, :float
    add_column :lead_purchases, :euro_value, :float
    add_column :lead_purchases, :estimate, :float
    add_column :lead_purchases, :euro_pipeline_value, :float
  end

  def self.down
    remove_column :lead_purchases, :euro_pipeline_value
    remove_column :lead_purchases, :estimate
    remove_column :lead_purchases, :euro_value
    remove_column :lead_purchases, :value
    remove_column :lead_purchases, :decision_date
  end
end
