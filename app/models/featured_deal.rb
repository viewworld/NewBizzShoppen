class FeaturedDeal < ActiveRecord::Base
  belongs_to :deal

  validates_presence_of :position

  POSITIONS = [0, 1, 2, 3]

  class << self

    def display_all
      POSITIONS.each { |number| FeaturedDeal.find_or_create_by_position(:position => number) } if all.size != POSITIONS.size
      all
    end

    def set_all(params)
      POSITIONS.each do |number|
        deal = FeaturedDeal.find_by_position(number)
        deal.update_attribute(:deal_id, params[number.to_s])
      end
    end

  end
end