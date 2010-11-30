class AddTranslationsToArticles < ActiveRecord::Migration
  def self.up
    Article.create_translation_table! :title => :string, :content => :text
  end

  def self.down
    Article.drop_translation_table!
  end
end
