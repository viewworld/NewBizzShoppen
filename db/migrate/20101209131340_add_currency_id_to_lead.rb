class AddCurrencyIdToLead < ActiveRecord::Migration
  def self.up
    add_column :leads, :currency_id, :integer
  end

  def self.down
    remove_column :leads, :currency_id
  end
end
