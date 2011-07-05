class AddCurrencyIdToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :currency_id, :integer
  end

  def self.down
    remove_column :campaigns, :currency_id
  end
end
