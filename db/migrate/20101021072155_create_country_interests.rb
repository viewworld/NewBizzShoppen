class CreateCountryInterests < ActiveRecord::Migration
  def self.up
    create_table :country_interests do |t|
      t.integer :country_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :country_interests
  end
end
