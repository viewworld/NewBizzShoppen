class AddIndexesOnTranslations < ActiveRecord::Migration
  def self.up
    add_index :translations, [:locale, :key]
  end

  def self.down
    remove_index :translations, :column => [:locale, :key]
  end
end
