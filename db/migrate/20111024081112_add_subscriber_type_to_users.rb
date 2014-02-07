class AddSubscriberTypeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :subscriber_type, :string, :default => "ad-hoc"
  end

  def self.down
    remove_column :users, :subscriber_type
  end
end
