class AddSavingToLead < ActiveRecord::Migration
  def self.up
    add_column :leads, :saving, :string
  end

  def self.down
    remove_column :leads, :saving
  end
end
