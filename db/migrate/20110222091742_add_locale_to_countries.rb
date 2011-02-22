class AddLocaleToCountries < ActiveRecord::Migration
  def self.up
    add_column :countries, :locale, :string
  end

  def self.down
    remove_column :countries, :locale
  end
end
