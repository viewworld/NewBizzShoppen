class AddCreatorNameToLead < ActiveRecord::Migration
  def self.up
    add_column :leads, :creator_name, :string
    add_index :leads, :creator_name
  end

  def self.down
    remove_column :leads, :creator_name
    remove_index :leads, :creator_name
  end
end
