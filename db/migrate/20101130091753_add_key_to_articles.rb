class AddKeyToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :key, :string
  end

  def self.down
    remove_column :articles, :key
  end
end
