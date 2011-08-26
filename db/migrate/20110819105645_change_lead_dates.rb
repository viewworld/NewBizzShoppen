class ChangeLeadDates < ActiveRecord::Migration
  def self.up
    change_column :leads, :start_date, :datetime
    change_column :leads, :end_date, :datetime
  end

  def self.down
    change_column :leads, :start_date, :date
    change_column :leads, :end_date, :date
  end
end
