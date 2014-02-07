class CreateCreditNotes < ActiveRecord::Migration
  def self.up
    create_table :credit_notes do |t|
      t.integer :number
      t.integer :invoice_id
      t.date :paid_at
      t.string :type
      t.timestamps
    end

    add_column :invoice_lines, :is_credited, :boolean, :default => false
  end

  def self.down
    drop_table :credit_notes
    remove_column :invoice_lines, :is_credited
  end
end
