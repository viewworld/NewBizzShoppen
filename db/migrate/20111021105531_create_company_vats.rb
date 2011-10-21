class CreateCompanyVats < ActiveRecord::Migration
  def self.up
    create_table :company_vats do |t|
      t.string :vat_number

      t.timestamps
    end
  end

  def self.down
    drop_table :company_vats
  end
end
