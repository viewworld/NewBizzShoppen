class AddTypeToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :type, :string
  end

  def self.down
    remove_column :leads, :type
  end
end
