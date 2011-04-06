class AddHideProfilePageToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :hide_profile_page, :boolean, :default => false
    execute "UPDATE users SET hide_profile_page = FALSE"
  end

  def self.down
    remove_column :users, :hide_profile_page
  end
end
