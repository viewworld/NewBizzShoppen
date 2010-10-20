class AddMobileAndDeptToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :mobile_phone, :string
    add_column :users, :department, :string
  end

  def self.down
    remove_column :users, :mobile_phone
    remove_column :users, :department
  end
end
