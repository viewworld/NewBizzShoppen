class RemoveScreenName < ActiveRecord::Migration
  def self.up
    remove_column :users, :screen_name
  end

  def self.down
    add_column :users, :screen_name, :string
  end
end
