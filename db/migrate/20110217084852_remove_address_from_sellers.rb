class RemoveAddressFromSellers < ActiveRecord::Migration
  def self.up
    remove_columns :sellers, :address, :country_id
  end

  def self.down
    add_column :sellers, :address, :text
    add_column :sellers, :country_id, :integer
  end
end
