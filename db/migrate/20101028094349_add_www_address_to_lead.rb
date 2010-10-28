class AddWwwAddressToLead < ActiveRecord::Migration
   def self.up
    add_column :leads, :www_address, :string
  end

  def self.down
    remove_column :leads, :www_address
  end
end