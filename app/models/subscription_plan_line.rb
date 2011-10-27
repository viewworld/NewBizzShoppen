class SubscriptionPlanLine < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true, :foreign_key => "resource_id"

  validates_presence_of :name, :price
  validates_numericality_of :price

  after_save :cache_prices

  private

  def cache_prices
    resource.cache_prices! if price_changed?
  end

  public

  def recalculate(total_days, paid_days)
    paid_days = 0 if paid_days < 0
    _new_price = (BigDecimal.new(price.to_s) / BigDecimal.new(total_days.to_s) * BigDecimal.new(paid_days.to_s)).round(2)
    self.update_attribute(:price, _new_price)
  end

end
