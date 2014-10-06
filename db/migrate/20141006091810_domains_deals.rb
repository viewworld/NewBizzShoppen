class DomainsDeals < ActiveRecord::Migration
  def self.up
    create_table :domains_deals, :id => false do |t|
      t.integer :domain_id
      t.integer :deal_id
    end

    add_index :domains_deals, [:domain_id, :deal_id]
    add_index :domains_deals, :deal_id
  end

  def self.down
    remove_index :domains_deals, [:damain_id, :deal_id]
    remove_index :domains_deals, :deal_id

    drop_table :domains_deals
  end
end
