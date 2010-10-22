class AddRssTokenToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :deal_value_range_start, :decimal
    add_column :users, :deal_value_range_end, :decimal
    add_column :users, :rss_token, :string
    add_column :users, :notify_about_new_leads, :boolean, :default => false
  end

  def self.down
  end
end
