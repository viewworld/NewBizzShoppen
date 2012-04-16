class FeaturedDeal < ActiveRecord::Base
  belongs_to :deal

  validates_presence_of :position
  scope :with_active_deals, lambda { |date| joins("LEFT JOIN leads ON featured_deals.deal_id = leads.id").order("featured_deals.position ASC").
      where("leads.published IS true AND leads.start_date <= :date AND leads.end_date >= :date ", :date => date).select("leads.*") }

  POSITIONS = (0..19).to_a

  class << self

    def primary
      if fd = where(:position => 0).first
        fd.deal
      else
        nil
      end
    end

    def display_all
      POSITIONS.each { |number| FeaturedDeal.find_or_create_by_position(:position => number) } if all.size != POSITIONS.size
      all
    end

    def set_all(params)
      POSITIONS.each do |number|
        if params and params[number.to_s]
          deal = FeaturedDeal.find_or_create_by_position(number)
          deal.update_attribute(:deal_id, params[number.to_s])
        end
      end
    end

  end
end