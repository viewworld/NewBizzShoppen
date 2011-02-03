class RemoveFieldsFromInvoice < ActiveRecord::Migration
  def self.up
    remove_column :invoice_lines, :pkwiu
    remove_column :invoice_lines, :unit
  end

  def self.down
    add_column :invoice_lines, :pkwiu, :string
    add_column :invoice_lines, :unit, :string
  end
end
