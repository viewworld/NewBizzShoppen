class AddRegionIdToAddresses < ActiveRecord::Migration
  def self.up
    add_column :addresses, :region_id, :integer
  end

  def self.down
    remove_column :addresses, :region_id
  end
end
