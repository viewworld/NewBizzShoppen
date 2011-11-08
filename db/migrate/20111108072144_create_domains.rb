class CreateDomains < ActiveRecord::Migration
  def self.up
    create_table :domains do |t|
      t.string :name
      t.string :locale
      t.string :site
      t.boolean :default, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :domains
  end
end
