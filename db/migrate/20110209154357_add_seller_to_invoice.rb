class AddSellerToInvoice < ActiveRecord::Migration
  def self.up
    add_column :invoices, :seller_id, :integer
  end

  def self.down
    remove_column :invoices, :seller_id
  end
end
