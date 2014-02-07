class AddHideProfilePageToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :hide_profile_page, :boolean, :default => false
  end

  def self.down
    remove_column :users, :hide_profile_page
  end
end
