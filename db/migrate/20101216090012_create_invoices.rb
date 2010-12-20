class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :number

      t.date :paid_at
      t.datetime :emailed_at

      t.integer :currency_id
      t.integer :user_id

      t.string :seller_name
      t.text :seller_address
      t.string :seller_vat_no
      t.string :seller_first_name
      t.string :seller_last_name

      t.string :customer_name
      t.text :customer_address
      t.string :customer_vat_no

      t.decimal :cash_flow, :precision => 10, :scale => 2, :default => 0.0

      t.string :creation_place
      t.date :creation_date, :default => Time.now
      t.date :sale_date, :default => Time.now
      t.date :payment_deadline_date, :default => Time.now + 14.days

      t.text :payment_account_information
      t.string :payment_method
      t.boolean :vat_paid_in_customer_country, :default => true
      t.boolean :english_version, :default => true
      t.string :total_in_words

      t.decimal :revenue_frozen, :precision => 10, :scale => 2, :default => 0.0

      t.string :invoices, :vat_text_in_customer_country

      t.timestamps
    end

    create_table :invoice_lines do |t|
      t.integer :number
      t.text :name
      t.string :pkwiu
      t.string :unit

      t.integer :quantity, :default => 1
      t.decimal :vat_rate, :default => 0.0
      t.decimal :netto_price, :precision => 10, :scale => 2
      t.decimal :netto_value, :precision => 10, :scale => 2
      t.decimal :brutto_value, :precision => 10, :scale => 2
      t.decimal :vat_value, :precision => 10, :scale => 2

      t.integer :payable_id
      t.string :payable_type

      t.integer :invoice_id
      t.string :payable_type

      t.decimal :revenue_frozen, :precision => 10, :scale => 2, :default => 0.0

      t.datetime :created_at
    end
  end

  def self.down
    drop_table :invoice_lines
    drop_table :invoices
  end
end
