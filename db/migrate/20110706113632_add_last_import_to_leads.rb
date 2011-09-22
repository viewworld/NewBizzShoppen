class AddLastImportToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :last_import, :boolean
  end

  def self.down
    remove_column :leads, :last_import
  end
end
