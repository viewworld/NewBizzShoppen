class AddPolymorphyToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :resource_type, :string
    add_column :articles, :resource_id, :integer
  end

  def self.down
    remove_column :articles, :resource_type
    remove_column :articles, :resource_id
  end
end
