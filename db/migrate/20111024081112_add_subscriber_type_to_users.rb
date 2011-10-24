class AddSubscriberTypeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :subscriber_type, :string, :default => "ad-hoc"
    ActiveRecord::Migration.execute "UPDATE users SET subscriber_type = 'ad-hoc' WHERE subscriber_type IS NULL"
  end

  def self.down
    remove_column :users, :subscriber_type
  end
end
