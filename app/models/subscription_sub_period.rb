class SubscriptionSubPeriod < ActiveRecord::Base

  include CommonSubscriptions

  belongs_to :subscription
  belongs_to :currency
  has_many :subscription_plan_lines, :as => :resource, :dependent => :destroy

  validates_presence_of :start_date, :subscription
  validates_uniqueness_of :start_date, :end_date, :scope => :subscription_id

  after_create :create_subscription_plan_lines

  private

  def create_subscription_plan_lines
    subscription.subscription_plan_lines.each do |spl|
      subscription_plan_lines.create!( :name => spl.name,
                                      :price => spl.price).recalculate(subscription.total_days, total_days)
    end
  end

  def cache_total_billing
    self.billing_price = total_billing
    self.euro_billing_price = currency.to_euro(billing_price)
  end

  public

  def cache_prices!
    cache_total_billing
    save!
  end

  def total_days
    (end_date - start_date).to_i
  end


end
