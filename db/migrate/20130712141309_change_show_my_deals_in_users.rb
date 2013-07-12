class ChangeShowMyDealsInUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :dont_show_my_deals, :boolean, :default => false

    execute "UPDATE users SET dont_show_my_deals = 'f' WHERE show_my_deals = 't'"
    execute "UPDATE users SET dont_show_my_deals = 't' WHERE show_my_deals = 'f'"

    remove_column :users, :show_my_deals
  end

  def self.down
    remove_column :users, :dont_show_my_deals
  end
end
