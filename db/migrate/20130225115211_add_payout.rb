class AddPayout < ActiveRecord::Migration
  def self.up
    add_column :campaigns_results, :payout, :decimal, :precision => 10, :scale => 2, :default => 0.0
    add_column :call_results, :payout, :decimal, :precision => 10, :scale => 2, :default => 0.0
    add_column :call_results, :euro_payout, :decimal, :precision => 10, :scale => 2, :default => 0.0
    add_column :call_results, :payout_currency_id, :integer
  end

  def self.down
    remove_column :campaigns_results, :payout
    remove_column :call_results, :payout
    remove_column :call_results, :euro_payout
    remove_column :call_results, :payout_currency_id
  end
end
