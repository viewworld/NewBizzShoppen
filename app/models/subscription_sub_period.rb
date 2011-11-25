class SubscriptionSubPeriod < ActiveRecord::Base

  include CommonSubscriptions

  belongs_to :subscription
  belongs_to :currency
  has_many :subscription_plan_lines, :as => :resource, :dependent => :destroy

  validates_presence_of :start_date, :subscription
  validates_uniqueness_of :start_date, :end_date, :scope => :subscription_id

  after_create :create_subscription_plan_lines

  scope :with_date, lambda{|date| where("start_date <= :date AND end_date >= :date", {:date => date})}
  scope :without_invoice, where(:invoice_id => nil)

  private

  def create_subscription_plan_lines
    subscription.subscription_plan_lines.each do |spl|
      subscription_plan_lines.create!(:name => spl.name,
                                      :price => spl.price).recalculate(subscription.total_days, total_days)
    end
  end

  def cache_prices
    self.billing_price = total_billing
    self.euro_billing_price = subscription.currency.to_euro(billing_price)
  end

  public

  def recalculate
    billing_cycle_days = subscription.billing_cycle * 7
    subscription_plan_lines.each{|spl| spl.recalculate(billing_cycle_days, total_days) }
  end

  def total_days
    (end_date + 1.day - start_date).to_i
  end


end
