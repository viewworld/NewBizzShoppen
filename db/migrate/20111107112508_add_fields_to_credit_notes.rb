class AddFieldsToCreditNotes < ActiveRecord::Migration
  def self.up
    add_column :credit_notes, :refund_price, :decimal, :precision => 10, :scale => 2
    add_column :credit_notes, :currency_id, :integer
    add_column :credit_notes, :description, :text
    add_column :credit_notes, :user_id, :integer
  end

  def self.down
    remove_column :credit_notes, :refund_price
    remove_column :credit_notes, :currency_id
    remove_column :credit_notes, :description
    remove_column :credit_notes, :user_id
  end
end
