class SetDefaultDealDomain < ActiveRecord::Migration
  def self.up
    fairdeals_domain = Domain.where(:site => 'fairdeals', :locale => 'da').first
    Deal.all.each do |deal|
      if deal.domains.blank?
        deal.domains << fairdeals_domain
        deal.save(:validate => false)
      end
    end
  end

  def self.down
    Deal.all.each do |deal|
      deal.domains = []
      deal.save(:validate => false)
    end
  end
end
