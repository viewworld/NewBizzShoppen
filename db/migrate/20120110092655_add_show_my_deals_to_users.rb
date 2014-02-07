class AddShowMyDealsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :show_my_deals, :boolean, :default => false
  end

  def self.down
    remove_column :users, :show_my_deals
  end
end
