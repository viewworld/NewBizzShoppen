class SubscriptionPlanLine < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true, :foreign_key => "resource_id"

  validates_presence_of :name, :price
  validates_numericality_of :price
  validate :price_in_context_of_billing_cycle

  after_save :cache_prices

  private

  def price_in_context_of_billing_cycle
    if resource.is_a?(SubscriptionPlan) and resource.payable? and (((price * 100) % resource.number_of_periods) > 0)
      errors.add(:price, :must_divide_by, :number => resource.number_of_periods)
    end
  end

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
