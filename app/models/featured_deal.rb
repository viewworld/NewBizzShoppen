class FeaturedDeal < ActiveRecord::Base
  POSITIONS = (0..19).to_a
  belongs_to :deal

  validates_presence_of :position
  scope :with_active_deals, lambda { |date|
    select('leadss.*').
      joins('LEFT JOIN leads AS leadss ON featured_deals.deal_id = leadss.id').
      joins('JOIN lead_translations ON lead_translations.lead_id = leadss.id').
      where("leadss.published IS true AND leadss.start_date <= :date AND leadss.end_date >= :date ", :date => date).
      where("lead_translations.locale = '#{I18n.locale}'").
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
