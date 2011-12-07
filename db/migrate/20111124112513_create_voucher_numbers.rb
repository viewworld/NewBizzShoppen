class CreateVoucherNumbers < ActiveRecord::Migration
  def self.up
     create_table :voucher_numbers do |t|
       t.integer :deal_id
       t.string :number
       t.string :deal_unique_id
       t.string :state, :default => "new"
       t.integer :user_id
       t.datetime :reserved_until
       t.timestamps
     end
  end

  def self.down
    drop_table :voucher_numbers
  end
end
