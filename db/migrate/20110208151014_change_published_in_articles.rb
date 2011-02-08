class ChangePublishedInArticles < ActiveRecord::Migration
  def self.up
#    add_column :articles, :published_at, :datetime
#    execute "UPDATE articles SET published_at=now() WHERE published IS TRUE"
#    remove_column :articles, :published
  end

  def self.down
#    add_column :articles, :published, :boolean
#    execute "UPDATE articles SET published = TRUE WHERE published_at IS NOT NULL"
#    remove_column :articles, :published_at
  end
end
