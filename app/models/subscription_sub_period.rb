class SubscriptionSubPeriod < ActiveRecord::Base

  include CommonSubscriptions

  belongs_to :subscription
  belongs_to :currency
  belongs_to :invoice
  has_many :subscription_plan_lines, :as => :resource, :dependent => :destroy

  validates_presence_of :start_date, :subscription
  validates_uniqueness_of :start_date, :end_date, :scope => :subscription_id

  after_create :create_subscription_plan_lines

  scope :billable, lambda { where("subscription_period > 0 AND billing_date IS NOT NULL AND billing_date <= ? AND invoiced_at IS NULL", Date.today) }

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

  def total_days
    (end_date + 1.day - start_date).to_i
  end

  def billable?
    subscription.subscription_period > 0 and billing_date and billing_date <= Date.today and !invoice
  end


end
