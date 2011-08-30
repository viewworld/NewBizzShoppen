class AddMaxAutoBuyToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :max_auto_buy, :integer
  end

  def self.down
    remove_column :leads, :max_auto_buy
  end
end
