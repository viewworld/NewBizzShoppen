class AddProlongsAsFreeToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :prolongs_as_free, :boolean, :default => false
  end

  def self.down
    remove_column :subscriptions, :prolongs_as_free
  end
end
