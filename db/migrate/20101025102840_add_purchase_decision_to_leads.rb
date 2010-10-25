class AddPurchaseDecisionToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :purchase_decision_date, :date
  end

  def self.down
    remove_column :leads, :purchase_decision_date
  end
end
