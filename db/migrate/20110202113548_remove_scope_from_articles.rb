class RemoveScopeFromArticles < ActiveRecord::Migration
  def self.up
    remove_column :articles, :scope
  end

  def self.down
    add_column :articles, :scope, :integer
  end
end
