class AddLastSentAtToInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :last_sent_at, :datetime, :default => nil
  end

  def self.down
    remove_column :invoices, :last_sent_at
  end
end
