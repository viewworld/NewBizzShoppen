class AddPublishedToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :published, :boolean, :default => false
    add_column :articles, :published_date, :datetime
  end

  def self.down
    remove_column :articles, :published
    remove_column :articles, :published_date
  end
end
