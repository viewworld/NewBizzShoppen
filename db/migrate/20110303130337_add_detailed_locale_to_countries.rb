class AddDetailedLocaleToCountries < ActiveRecord::Migration
  def self.up
    add_column :countries, :detailed_locale, :string
  end

  def self.down
    remove_column :countries, :detailed_locale
  end
end
