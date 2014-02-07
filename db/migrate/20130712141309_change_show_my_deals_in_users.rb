class ChangeShowMyDealsInUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :dont_show_my_deals, :boolean, :default => false
    remove_column :users, :show_my_deals
  end

  def self.down
    remove_column :users, :dont_show_my_deals
  end
end
