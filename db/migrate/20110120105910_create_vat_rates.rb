class CreateVatRates < ActiveRecord::Migration
  def self.up
    create_table :vat_rates do |t|
      t.integer :country_id
      t.number :rate

      t.timestamps
    end
  end

  def self.down
    drop_table :vat_rates
  end
end
