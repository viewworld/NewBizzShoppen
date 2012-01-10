class AddShowMyDealsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :show_my_deals, :boolean, :default => false
    ActiveRecord::Migration.execute("UPDATE users SET show_my_deals = 'f' WHERE show_my_deals IS NULL")
  end

  def self.down
    remove_column :users, :show_my_deals
  end
end
