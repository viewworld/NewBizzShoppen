class AddSaleLimitToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :sale_limit, :integer
  end

  def self.down
    remove_column :leads, :sale_limit
  end
end
