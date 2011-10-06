class FeaturedDeal < ActiveRecord::Base
  belongs_to :deal

  validates_presence_of :position

  POSITIONS = (0..9).to_a
  BACKUP_POSITIONS = (10..18).to_a

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
      (BACKUP_POSITIONS + POSITIONS).each do |number|
        if params and params[number.to_s]
          deal = FeaturedDeal.find_or_create_by_position(number)
          deal.update_attribute(:deal_id, params[number.to_s])
        end
      end
    end

    def on_position(position)
      where(:position => position).first
    end

    def deal_on_position(position)
      if fd = on_position(position)
        fd.deal
      else
        nil
      end
    end

    def deal_id_on_position(position)
      if deal = deal_on_position(position)
        deal.id
      else
        nil
      end
    end

  end
end