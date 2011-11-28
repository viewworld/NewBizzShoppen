class SubscriptionSubPeriod < ActiveRecord::Base

  include CommonSubscriptions

  belongs_to :subscription
  belongs_to :invoice
  belongs_to :refund
  has_many :subscription_plan_lines, :as => :resource, :dependent => :destroy

  validates_presence_of :start_date, :subscription

  after_create :create_subscription_plan_lines

  delegate :currency, :to => :subscription

  scope :with_date, lambda{|date| where("start_date <= :date AND end_date >= :date", {:date => date})}
  scope :without_invoice, where(:invoice_id => nil)
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

  def recalculate
    billing_cycle_days = subscription.billing_cycle * 7
    prices_hash = subscription_plan_lines.map{|spl| spl.recalculate(billing_cycle_days, total_days) }
    price_to_refund = prices_hash.sum { |ph| ph[:old_price] - ph[:new_price] }
    if invoice and end_date >= Date.today-1 and !refund and price_to_refund > 0
      self.refund = Refund.create(:user => subscription.user, :refund_price => price_to_refund, :currency => currency,
                    :description => I18n.t("models.credit_note.descriptions.subscription_refund",
                    :days => prices_hash.sum { |ph| ph[:unused_days] }, :name => subscription.name))
      self.save
    end
  end

  def total_days
    (end_date + 1.day - start_date).to_i
  end

  def billable?
    subscription.subscription_period > 0 and billing_date and billing_date <= Date.today and !invoice
  end


end
