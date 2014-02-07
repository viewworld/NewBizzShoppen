class RemoveCityFromLeads < ActiveRecord::Migration
  def self.up
    remove_column :leads, :city
  end

  def self.down
    add_column :leads, :city, :string
  end
end
