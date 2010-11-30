class AddScopeToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :scope, :integer
  end

  def self.down
    remove_columns :articles, :scope
  end
end
