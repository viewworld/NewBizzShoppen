class CreateCategoriesCountries < ActiveRecord::Migration
  def self.up
    create_table :category_countries do |t|
      t.integer :category_id
      t.integer :country_id
    end
  end

  def self.down
    drop_table :categories_countries
  end
end
