class AddOwnerNoteToLeadPurchases < ActiveRecord::Migration
  def self.up
    add_column :lead_purchases, :owner_note, :text
  end

  def self.down
    remove_column :lead_purchases, :owner_note
  end
end
