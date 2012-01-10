class AddAutoBuyEnabledToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :auto_buy_enabled, :boolean, :default => nil
  end

  def self.down
    remove_column :users, :auto_buy_enabled
  end
end
