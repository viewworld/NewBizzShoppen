class CreateLocales < ActiveRecord::Migration
  def self.up
   create_table :locales do |t|
     t.string :language
     t.string :code
     t.string :symbol
     t.boolean :enabled, :default => false
   end
  end

  def self.down
    drop_table :locales
  end
end
