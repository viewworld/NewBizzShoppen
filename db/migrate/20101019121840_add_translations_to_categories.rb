class AddTranslationsToCategories < ActiveRecord::Migration
  def self.up
    Category.create_translation_table! :name => :string, :description => :text
  end

  def self.down
    Category.drop_translation_table!
  end
end