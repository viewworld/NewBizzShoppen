class SubscriptionPlanLine < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true, :foreign_key => "resource_id"

  validates_presence_of :name, :price
  validates_numericality_of :price

  after_create :reload
  after_save :cache_prices
  after_destroy :cache_prices
  before_save :apply_vat_rate

  private

  def cache_prices
    resource.cache_prices! if resource
  end

  public

  def price_divides_by?(num)
    ((price * 100) % num) == 0
  end

  def recalculate(total_days, paid_days)
    paid_days = 0 if paid_days < 0
    _old_price = price
    _new_price = (BigDecimal.new(price.to_s) / BigDecimal.new(total_days.to_s) * BigDecimal.new(paid_days.to_s)).round(2)
    self.price = _new_price
    self.save!
    { :old_price => _old_price, :new_price => _new_price, :unused_days => total_days-paid_days }
  end

  def vat_rate
    if resource.is_a?(Subscription)
      resource.vat_rate
    elsif resource.is_a?(SubscriptionSubPeriod)
      resource.subscription.vat_rate
    else
      0
    end
  end

  def apply_vat_rate
    if price_changed?
      self.brutto_price = vat_rate.to_f > 0 ? price + (price * BigDecimal(vat_rate.to_s).div(100,4)) : price
    end
  end

end
