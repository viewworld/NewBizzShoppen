class AddCreatorNameToLead < ActiveRecord::Migration
  def self.up
    add_column :leads, :creator_name, :string
  end

  def self.down
    remove_column :leads, :creator_name
  end
end
