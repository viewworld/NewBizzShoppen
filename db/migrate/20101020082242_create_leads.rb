class CreateLeads < ActiveRecord::Migration
  def self.up
    create_table :leads do |t|
      t.string :header
      t.integer :category_id
      t.text :description
      t.text :hidden_description
      t.integer :creator_id, :null => false
      t.string :creator_type, :null => false
      t.integer :clicks_count, :default => 0
      t.decimal :purchase_value
      t.decimal :price
      t.integer :country_id
      t.string :company_name, :null => false
      t.string :lead_name, :null => false
      t.string :phone_number, :null => false
      t.string :email_address, :null => false
      t.text :address
      t.timestamps
    end

    add_index :leads, :category_id
    add_index :leads, :country_id
    add_index :leads, :company_name
    add_index :leads, :header
  end

  def self.down
    drop_table :leads
  end
end
