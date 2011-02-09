class CreateSellers < ActiveRecord::Migration
  def self.up
    create_table :sellers do |t|
      t.string :name
      t.text :address
      t.string :vat_no
      t.string :first_name
      t.string :last_name
      t.integer :country_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sellers
  end
end
