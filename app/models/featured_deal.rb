class FeaturedDeal < ActiveRecord::Base
  POSITIONS = (0..19).to_a
  belongs_to :deal

  validates_presence_of :position

  scope :with_locale, lambda {
    joins('JOIN lead_translations ON lead_translations.lead_id = leads.id').
      joins('LEFT JOIN domains_deals ON domains_deals.deal_id = leads.id').
      joins('LEFT JOIN domains ON domains.id = domains_deals.domain_id').
      where("(lead_translations.locale = '#{I18n.locale}') OR (domains.locale = '#{I18n.locale}')") }

  scope :with_active_deals, lambda { |date|
    select('leads.*').
      joins('LEFT JOIN leads AS leads ON featured_deals.deal_id = leads.id').
      where("leads.published IS true AND leads.start_date <= :date AND leads.end_date >= :date ", :date => date).
      order('featured_deals.position ASC') }

  def self.primary
    where(:position => 0).try(:first).try(:deal)
  end

  def self.display_all
    POSITIONS.each { |number| FeaturedDeal.find_or_create_by_position(:position => number) } if all.size != POSITIONS.size
    all
  end

  def self.set_all(params)
    POSITIONS.each do |number|
      if params and params[number.to_s]
        deal = FeaturedDeal.find_or_create_by_position(number)
        deal.update_attribute(:deal_id, params[number.to_s])
      end
    end
  end
end
