class AddSavingInMoneyToLead < ActiveRecord::Migration
  def self.up
    add_column :leads, :saving_in_money, :string
    Deal.all.each do |deal|
      deal.update_attribute(:saving_in_money, deal._saving_in_money)
    end
  end

  def self.down
    remove_column :leads, :saving_in_money
  end
end
