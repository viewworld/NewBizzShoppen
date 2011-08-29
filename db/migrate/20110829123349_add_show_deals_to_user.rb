class AddShowDealsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :show_deals, :boolean, :default => false
    execute "UPDATE users SET show_deals = false"
  end

  def self.down
    remove_column :users, :show_deals
  end
end
