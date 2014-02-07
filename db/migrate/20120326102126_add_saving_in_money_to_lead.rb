class AddSavingInMoneyToLead < ActiveRecord::Migration
  def self.up
    add_column :leads, :saving_in_money, :string
  end

  def self.down
    remove_column :leads, :saving_in_money
  end
end
