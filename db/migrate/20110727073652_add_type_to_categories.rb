class AddTypeToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :type, :string

    ActiveRecord::Migration.execute "UPDATE categories SET type = 'LeadCategory' WHERE type IS NULL"
  end

  def self.down
    remove_column :categories, :type
  end
end
