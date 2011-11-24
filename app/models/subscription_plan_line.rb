class SubscriptionPlanLine < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true, :foreign_key => "resource_id"

  validates_presence_of :name, :price
  validates_numericality_of :price
  #validate do |spl|
  #  if spl.resource.is_a?(SubscriptionPlan) and spl.resource.payable? and ((spl.price * 100) % spl.resource.number_of_periods) > 0
  #    errors.add(:price, :must_divide_by, :number => spl.resource.number_of_periods)
  #  end
  #end

  after_save :cache_prices

  private

  def cache_prices
    resource.cache_prices! if price_changed?
  end

  public

  def recalculate(total_days, paid_days)
    paid_days = 0 if paid_days < 0
    _new_price = (BigDecimal.new(price.to_s) / BigDecimal.new(total_days.to_s) * BigDecimal.new(paid_days.to_s)).round(2)
    self.price = _new_price
    self.save!
  end

end
