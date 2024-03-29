class SubscriptionSubPeriod < ActiveRecord::Base

  include CommonSubscriptions

  belongs_to :subscription
  belongs_to :invoice
  belongs_to :refund
  has_many :subscription_plan_lines, :as => :resource, :dependent => :destroy
  has_many :subscription_payment_notifications, :primary_key => :paypal_txn_id, :foreign_key => :transaction_id

  validates_presence_of :start_date, :subscription

  after_create :create_subscription_plan_lines
  after_save :create_invoice_when_marked_as_paid

  delegate :currency, :user, :to => :subscription

  scope :with_date, lambda{|date| where("start_date <= :date AND end_date >= :date", {:date => date})}
  scope :without_invoice, where(:invoice_id => nil)
  scope :billable, lambda { where("billing_date IS NOT NULL AND billing_date <= ? AND invoice_id IS NULL", Date.today) }
  scope :with_paypal_txn_id, lambda {|txn_id| where(:paypal_txn_id => txn_id)}
  scope :paypal_unpaid, where("paypal_paid_auto IS NOT TRUE AND paypal_paid_manual IS NOT TRUE")
  scope :for_recurring_payment, lambda { |recurring_payment_id| where("subscriptions.paypal_profile_id = ?", recurring_payment_id).joins(:subscription).order("subscription_sub_periods.id") }
  scope :without_invoice, where(:invoice_id => nil)
  scope :with_billing_date_greater_or_equal, lambda { |date| where("billing_date >= ?", date) }
  scope :with_billing_date_less_or_equal, lambda { |date| where("subscription_sub_periods.billing_date <= ?", date) }
  scope :with_paypal_cancelled, where("subscriptions.cancelled_in_paypal = ?", true).joins(:subscription)

  private

  def create_subscription_plan_lines
    subscription.subscription_plan_lines.each do |spl|
      subscription_plan_lines.create!(:name => spl.name,
                                      :price => spl.price)
    end
  end

  def cache_prices
    self.billing_price = total_billing
    self.euro_billing_price = subscription.currency.to_euro(billing_price)
  end

  def create_and_send_invoice!
    _invoice = Invoice.create(:user => subscription.user, :subscription_sub_period_id => self.id, :currency => subscription.currency)
    _invoice.send_by_email(user)
    PaypalTransaction.create(:invoice => _invoice, :amount => _invoice.total, :paid_at => Time.now) if _invoice.paid?
  end

  def create_invoice_when_marked_as_paid
    if !invoice and paypal_paid_auto_changed? and paypal_paid_auto?
      create_and_send_invoice!
    end
  end

  public

  def recalculate
    billing_cycle_days = subscription.billing_cycle * 7
    prices_hash = subscription_plan_lines.map{|spl| spl.recalculate(billing_cycle_days, total_days) }
    price_to_refund = prices_hash.sum { |ph| ph[:old_price] - ph[:new_price] }
    if invoice and end_date >= Date.today-1 and !refund and price_to_refund > 0
      self.refund = Refund.create(:user => subscription.user,
                                  :invoice_id => invoice.id,
                                  :refund_price => price_to_refund,
                                  :currency => currency,
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

  def paypal_paid?
    paypal_paid_auto? or paypal_paid_manual?
  end

  def update_recurring_payment_status(spn)
    if !paypal_paid? and spn.status == "Completed"
      update_attribute(:paypal_paid_auto, true)
    end
  end

  def self.create_unpaid_invoices_for_unpaid_sub_periods
    SubscriptionSubPeriod.without_invoice.with_billing_date_less_or_equal(Date.today).with_paypal_cancelled.readonly(false).each do |sp|
      sp.send(:create_and_send_invoice!)
    end
  end

  def total_brutto_billing
    subscription_plan_lines.inject(0.0) { |total, subscription_plan_line| subscription_plan_line.brutto_price.to_f + total }
  end
end
