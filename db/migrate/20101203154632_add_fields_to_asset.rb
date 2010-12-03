class AddFieldsToAsset < ActiveRecord::Migration
  def self.up
    add_column :assets, :type, :string, :limit => 25
    add_column :assets, :guid, :string, :limit => 10
    add_column :assets, :locale, :string, :limit => 1, :default => 0
	  add_column :assets, :user_id, :integer
    add_column :assets, :created_at, :datetime
    add_column :assets, :updated_at, :datetime
  end

  def self.down
    remove_column :assets, :type
    remove_column :assets, :guid
    remove_column :assets, :locale
    remove_column :assets, :user_id
    remove_column :assets, :created_at
    remove_column :assets, :uploaded_at
  end
end
