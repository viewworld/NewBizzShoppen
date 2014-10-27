class AddDomainIdToFeaturedDeals < ActiveRecord::Migration
  def self.up
    add_column :featured_deals, :domain_id, :integer
    add_index :featured_deals, :domain_id

    FeaturedDeal.update_all(:domain_id => Domain.for_fairdeals.where(:locale => 'da').first)
  end

  def self.down
    remove_index :featured_deals, :domain_id
    remove_column :featured_deals, :domain_id
  end
end
