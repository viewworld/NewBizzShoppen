class AddPayoutLockedParentToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :payout, :float
    add_column :users, :locked, :boolean, :default => false
    add_column :users, :parent_id, :integer
    add_column :users, :age, :integer
  end

  def self.down
    remove_column :users, :payout
    remove_column :users, :locked
    remove_column :users, :parent_id
    remove_column :users, :age
  end
end
