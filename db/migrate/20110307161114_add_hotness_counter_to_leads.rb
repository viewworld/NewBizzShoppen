class AddHotnessCounterToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :hotness_counter, :integer
  end

  def self.down
    remove_column :leads, :hotness_counter
  end
end
