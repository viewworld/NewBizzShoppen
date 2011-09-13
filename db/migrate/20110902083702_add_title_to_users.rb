class AddTitleToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :title, :string
    add_column :leads, :contact_title, :string
  end

  def self.down
    remove_column :users, :title
    remove_column :leads, :contact_title
  end
end
