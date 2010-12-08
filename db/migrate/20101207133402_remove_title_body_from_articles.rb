class RemoveTitleBodyFromArticles < ActiveRecord::Migration
  def self.up
    remove_column :articles, :title
    remove_column :articles, :content
  end

  def self.down
    add_column :articles, :title, :string
    add_column :articles, :content, :text
  end
end
