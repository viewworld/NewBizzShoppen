class RemoveTotalInWordsFromInvoices < ActiveRecord::Migration
  def self.up
    remove_column :invoices, :total_in_words
  end

  def self.down
    add_column :invoices, :total_in_words, :string
  end
end
