class RemoveScopeFromArticles < ActiveRecord::Migration
  def self.up
    [[0,"Article::Cms::MainPageArticle"],[1,"Article::Cms::InterfaceContentText"],[2,"Article::Cms::HelpPopup"]].each do |arr|
      Article::Cms.where(:scope => arr[0]).each{|a| a.type=arr[1];a.save}
    end
    [[0,"Article::News::Agent"],[1,"Article::News::Supplier"],[2,"Article::News::Member"]].each do |arr|
      Article::News.where(:scope => arr[0]).each{|a| a.type=arr[1];a.save}
    end
    remove_column :articles, :scope
  end

  def self.down
    add_column :articles, :scope, :integer
  end
end
