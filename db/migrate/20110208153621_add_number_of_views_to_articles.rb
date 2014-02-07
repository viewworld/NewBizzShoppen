class AddNumberOfViewsToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :views_count, :integer, :default => 0
  end

  def self.down
    remove_column :articles, :views_count, :integer
  end
end
