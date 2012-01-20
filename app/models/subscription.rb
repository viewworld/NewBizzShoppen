class Subscription < ActiveRecord::Base

  include CommonSubscriptions

  has_many :subscription_plan_lines, :as => :resource, :dependent => :destroy
  has_many :subscription_sub_periods, :order => "start_date ASC", :dependent => :destroy
  belongs_to :user
  belongs_to :subscription_plan
  belongs_to :currency
  belongs_to :seller
  belongs_to :automatic_downgrade_subscription_plan, :class_name => "SubscriptionPlan"
  after_create :handle_user_privileges
  after_create :create_subscription_sub_periods
  after_save :check_if_paypal_retries_exceeded

  acts_as_list :scope => :user_id
  scope :active, lambda { where("is_active = ? and ((end_date IS NULL and subscription_period = 0) or end_date >= ?)", true, Date.today) }
  scope :billable, lambda { where("subscription_period > 0 AND billing_date IS NOT NULL AND billing_date <= ? AND invoiced_at IS NULL", Date.today) }
  scope :future, lambda { where("start_date > ?", Date.today) }
  scope :for_recurring_payment, lambda {|payment_id| where(:paypal_profile_id => payment_id) }
  scope :with_currency, lambda { |currency| where(:currency_id => currency.id) }

  attr_accessor :next_subscription_plan, :next_subscription_plan_start_date

  liquid :create_recurring_profile_from_next_billing_cycle_link

  include AASM

  aasm_initial_state Proc.new { |subscription| subscription.initial_state }

  aasm_state :normal
  aasm_state :lockup
  aasm_state :upgraded, :enter => :perform_upgrade
  aasm_state :downgraded, :enter => :perform_downgrade
  aasm_state :cancelled, :enter => :perform_cancel
  aasm_state :cancelled_during_lockup
  aasm_state :penalty, :enter => :perform_penalty
  aasm_state :non_cancelable
  aasm_state :prolonged, :enter => :perform_prolong
  aasm_state :upgraded_from_penalty
  aasm_state :admin_changed, :enter => :perform_admin_change
  aasm_state :unconfirmed_paypal
  aasm_state :confirmed_paypal
  aasm_state :downgraded_paypal

  aasm_event :enter_lockup do
    transitions :from => [:normal, :penalty, :non_cancelable], :to => :lockup, :guard => :lockup_period_started?
  end

  aasm_event :upgrade do
    transitions :from => [:normal, :lockup], :to => :upgraded
  end

  aasm_event :confirm_paypal, :after => :perform_confirm_paypal do
    transitions :from => :unconfirmed_paypal, :to => :confirmed_paypal
  end

  aasm_event :downgrade do
    transitions :from => [:normal, :penalty], :to => :downgraded
  end

  aasm_event :downgrade_paypal, :after => :perform_downgrade_paypal do
    transitions :from => [:normal, :lockup], :to => :downgraded_paypal, :guard => :can_be_downgraded_paypal?
  end

  aasm_event :cancel do
    transitions :from => :normal, :to => :cancelled
  end

  aasm_event :cancel_during_lockup, :after => :perform_cancelled_during_lockup do
    transitions :from => :lockup, :to => :cancelled_during_lockup
  end

  aasm_event :prolong do
    transitions :from => [:normal, :lockup, :penalty, :cancelled, :non_cancelable, :admin_changed], :to => :prolonged, :guard => :can_be_prolonged?
  end

  aasm_event :upgrade_from_penalty, :after => :perform_upgrade_from_penalty do
    transitions :from => [:penalty, :non_cancelable], :to =>  :upgraded_from_penalty
  end

  aasm_event :admin_change do
    transitions :from => Subscription.aasm_states.map(&:name), :to => :admin_changed
  end

  aasm_event :normalize, :after => :perform_normalize do
    transitions :from => [:cancelled, :cancelled_during_lockup], :to => :normal, :guard => :use_paypal?
  end

  def self.canceled_in_paypal(prof_id, spn)
    if subscription = SubscriptionSubPeriod.paypal_unpaid.for_recurring_payment(prof_id).readonly(false).first.subscription
      unless subscription.admin_changed?
        if subscription.may_cancel?
          subscription.cancel!
        else
          subscription.cancel_during_lockup!
        end
        subscription.update_attribute(:cancelled_in_paypal, true)
        subscription.send_paypal_profile_reactivation_link
      end
    else
      EmailNotification.notify("recurring_payment_profile_cancel: Subscription not found", "<p>SubscriptionPaymentNotification: #{spn.id}</p> <>br /> Backtrace: <p>#{spn.params.inspect}</p>")
    end
  end

  def self.payment_failed(prof_id, spn)
    subscription = SubscriptionSubPeriod.paypal_unpaid.for_recurring_payment(prof_id).readonly(false).first.subscription

    if subscription
     subscription.update_attribute(:paypal_retries_counter, subscription.paypal_retries_counter + 1)
    else
      EmailNotification.notify("recurring_payment_failed: Subscription not found", "<p>SubscriptionPaymentNotification: #{spn.id}</p> <>br /> Backtrace: <p>#{spn.params.inspect}</p>")
    end
  end

  def self.payment_suspended(prof_id, spn)
    subscription = SubscriptionSubPeriod.paypal_unpaid.for_recurring_payment(prof_id).readonly(false).first.subscription

    if subscription
     subscription.update_attribute(:paypal_retries_counter, subscription.paypal_retries)
    else
      EmailNotification.notify("recurring_payment_suspended_due_to_max_failed_payment: Subscription not found", "<p>SubscriptionPaymentNotification: #{spn.id}</p> <>br /> Backtrace: <p>#{spn.params.inspect}</p>")
    end
  end

  def initial_state
    last_subscription = user.subscriptions.last
    if last_subscription and last_subscription.cancelled_during_lockup?
      :penalty
    elsif last_subscription and last_subscription.upgraded_from_penalty?
      :non_cancelable
    elsif (last_subscription.nil? or (is_today_in_free_period? and !paypal_billing_at_start?)) and use_paypal?
      :unconfirmed_paypal
    else
      :normal
    end
  end

  def lockup_period_started?
    lockup_period.to_i > 0 and Date.today >= lockup_start_date
  end

  def lockup_start_date
    end_date - lockup_period.to_i.weeks
  end

  def apply_time_constraints(_start_date)
    self.start_date = _start_date
    if subscription_period > 0
      self.end_date = start_date + subscription_period.weeks - 1.day
      if free_period_can_be_applied?
        self.end_date =  end_date + free_period.weeks
        CompanyVat.create(:vat_number => user.vat_number.strip)
      end
      self.billing_date = start_date + billing_period.to_i.weeks
    end
  end

  def cache_prices
    self.billing_price = total_billing
    self.euro_billing_price = currency.to_euro(billing_price)
  end

  def self.clone_from_subscription_plan!(subscription_plan, user, start_date=nil, paypal_invoice_id=nil)
    subscription = Subscription.new(:user => user, :vat_rate => !user.not_charge_vat? ? subscription_plan.seller.vat_rate : 0)
    subscription_plan.attributes.keys.except(["id", "roles_mask", "created_at", "updated_at", "billing_price", "is_active", "aasm_state", "paypal_retires_counter"]).each do |method|
      subscription.send("#{method}=".to_sym, subscription_plan.send(method.to_sym))
    end
    subscription.subscription_plan = subscription_plan.is_a?(Subscription) ? subscription_plan.subscription_plan : subscription_plan
    subscription_plan.subscription_plan_lines.each do |line|
      subscription.subscription_plan_lines << line.clone
    end
    subscription.apply_time_constraints(start_date ? start_date : Date.today)
    subscription.paypal_invoice_id = paypal_invoice_id
    subscription.billing_period = 0 if subscription.use_paypal?
    subscription.save
    subscription.reload
    subscription.cache_prices!
    subscription
  end

  def recalculate_subscription_plan_lines(new_end_date, is_free_period)
    unless is_free?
      total_days = subscription_period * 7
      paid_days = (new_end_date - start_date).to_i
      paid_days -= free_period * 7 if is_free_period

      subscription_plan_lines.each do |spl|
        spl.recalculate(total_days, paid_days)
      end

      subscription_sub_periods.where("start_date > ?", new_end_date + 1.day).without_invoice.destroy_all
      if sub_period_including_new_end_date = subscription_sub_periods.with_date(new_end_date + 1.day).first
        sub_period_including_new_end_date.update_attribute(:end_date, new_end_date)
      end
      subscription_sub_periods.each{|sp| sp.recalculate}
    end
  end

  def perform_cancel
    self.prolongs_as_free = true
    self.cancelled_at = Time.now
  end

  def perform_cancelled_during_lockup
    self.cancelled_at = Time.now
    self.class.clone_from_subscription_plan!(self.subscription_plan, user, end_date + 1.day)
  end

  def perform_normalize
    self.cancelled_at = nil
    self.cancelled_in_paypal = false
    self.prolongs_as_free = false
    self.save
  end

  def perform_upgrade
    cancel_paypal_profile if use_paypal?
    self.recalculate_subscription_plan_lines(Date.today-1, is_free_period_applied?)
    self.end_date = Date.today-1
    self.class.clone_from_subscription_plan!(next_subscription_plan, user)
  end

  def perform_downgrade
    self.class.clone_from_subscription_plan!(next_subscription_plan, user, end_date+1)
  end

  def perform_penalty
    self.prolongs_as_free = true
  end

  def perform_prolong
    self.class.clone_from_subscription_plan!(prolongs_as_free? ? SubscriptionPlan.active.free.for_role(user.role).first : self, user, end_date+1, paypal_invoice_id)
  end

  def perform_upgrade_from_penalty
    self.recalculate_subscription_plan_lines(Date.today-1, is_free_period_applied?)
    self.end_date = Date.today-1
    self.class.clone_from_subscription_plan!(next_subscription_plan, user)
  end

  def perform_admin_change
    cancel_paypal_profile if use_paypal?
    self.recalculate_subscription_plan_lines(next_subscription_plan_start_date-1, is_free_period_applied?)
    self.end_date = next_subscription_plan_start_date-1
    self.prolongs_as_free = true
    self.class.clone_from_subscription_plan!(next_subscription_plan, user, next_subscription_plan_start_date)
  end

  def perform_confirm_paypal
    self.end_date = Date.today-1
    self.class.clone_from_subscription_plan!(self, user)
  end

  def perform_downgrade_paypal
    cancel_paypal_profile
    self.recalculate_subscription_plan_lines(Date.today-1, is_free_period_applied?)
    self.end_date = Date.today-1
    self.class.clone_from_subscription_plan!(automatic_downgrade_subscription_plan, user)
  end

  def invoiced?
    !invoiced_at.blank?
  end

  def can_be_downgraded_to?(subscription_plan)
    can_be_downgraded? and subscription_plan.total_billing < total_billing and may_downgrade?
  end

  def can_be_upgraded_to?(subscription_plan)
    can_be_upgraded? and subscription_plan.total_billing >= total_billing and (may_upgrade? or may_upgrade_from_penalty?)
  end

  def can_be_prolonged?
    !is_free? and end_date < Date.today
  end

  def can_be_downgraded_paypal?
    use_paypal? and automatic_downgrading?
  end

  def can_cancel_at
    if !is_free? and normal?
      start_date + 1.day
    elsif downgraded?
      end_date + 1.day
    else
      nil
    end
  end

  def free_period_can_be_applied?
    free_period.to_i > 0 and user.has_free_period_available?
  end

  def free_period_used?
    CompanyVat.where(:vat_number => user.vat_number.strip).first
  end

  def is_free_period_applied?
    free_period.to_i > 0 and end_date and (end_date - start_date).to_i == (subscription_period.to_i + free_period.to_i) * 7 - 1
  end

  def is_today_in_free_period?
    is_free_period_applied? and Date.today <= (start_date + free_period.weeks - 1.day) and Date.today >= start_date
  end

  def free_subscription_end_date
    is_free_period_applied? ? start_date + free_period.weeks : nil
  end

  def will_prolong?
    !is_free?
  end

  def self.auto_prolong
    User.all_subscribers.each do |user|
      user.active_subscription
      user.handle_privileges
      if user.ad_hoc? and user.subscriptions.order("position").detect { |s| !s.billing_date.nil? and s.billing_date <= Date.today }
        user.update_attribute(:subscriber_type, User::SUBSCRIBER_TYPE_SUBSCRIBER)
      end
    end
  end

  def days_left
    (end_date - Date.today).to_i
  end

  def total_days
    (end_date - start_date + 1).to_i
  end

  def decrement_free_deals_in_free_period!
    if free_deals_in_free_period.to_i > 0
      self.free_deals_in_free_period = free_deals_in_free_period-1
      save
    end
  end

  def big_buyer?
    if unconfirmed_paypal? and !is_today_in_free_period?
      false
    else
      read_attribute(:big_buyer)
    end
  end

  def team_buyers?
    if unconfirmed_paypal? and !is_today_in_free_period?
      false
    else
      read_attribute(:team_buyers)
    end
  end

  def deal_maker?
    if unconfirmed_paypal? and !is_today_in_free_period?
      false
    else
      read_attribute(:deal_maker)
    end
  end

  def can_be_downgraded?
    if unconfirmed_paypal?
      false
    else
      read_attribute(:can_be_downgraded)
    end
  end

  def can_be_upgraded?
    if unconfirmed_paypal?
      true
    else
      read_attribute(:can_be_upgraded)
    end
  end

  def prolongs_as_free?
    if unconfirmed_paypal?
      true
    else
      read_attribute(:prolongs_as_free)
    end
  end

  def cancel_paypal_profile
    PaypalRecurringProfile.new(paypal_profile_id).cancel_profile if paypal_profile_id
  end

  def send_paypal_profile_reactivation_link
    TemplateMailer.delay(:queue => 'emails').new(user.email, :subscription_cancelled_through_paypal, Country.get_country_from_locale, {:subscription => self})
  end

  def next_billing_cycle_for_recurring_payment_renewal
    subscription_sub_periods.paypal_unpaid.without_invoice.with_billing_date_greater_or_equal(Date.today).first
  end

  def create_recurring_profile_from_next_billing_cycle_link
    "http://#{user.domain_name}/my_profile/subscription_plans/#{id}/paypal_renew"
  end


  def send_end_of_free_period_email
    TemplateMailer.delay(:queue => 'emails').new(user.email, :subscription_free_period_ended_for_paypal, Country.get_country_from_locale, {:subscription => self})
  end

  def self.send_reminder_about_end_of_free_period
    Subscription.where("aasm_state = ? and free_period > 0", "unconfirmed_paypal").
                 select { |s| s.free_subscription_end_date <= Date.today }.each { |s| s.send_end_of_free_period_email }
  end

  def total_brutto_billing
    subscription_sub_periods.inject(0.0) { |total, subscription_sub_period|  subscription_sub_period.total_brutto_billing + total }
  end

  def total_brutto_billing_for_sub_period
    subscription_sub_periods.first.total_brutto_billing
  end

  private

  def handle_user_privileges
    user.handle_privileges
  end

  def create_subscription_sub_periods
    number_of_periods = billing_cycle.eql?(0) ? 1 : (subscription_period/billing_cycle)
    number_of_periods.times do |n|
      period_start_date = start_date + (n * billing_cycle).weeks
      period_end_date   = period_start_date + billing_cycle.weeks - 1.day
      subscription_sub_periods.create!(:start_date => period_start_date,
                                      :end_date => (is_free? and !unconfirmed_paypal?) ? nil : period_end_date,
                                      :paypal_retries => paypal_retries,
                                      :billing_date => is_free? ? nil : (n == 0 and billing_period.to_i < 0) ? period_start_date : (period_start_date + billing_period.to_i.weeks))
    end
  end

  def check_if_paypal_retries_exceeded
    if use_paypal? and paypal_retries_counter_changed? and paypal_retries == paypal_retries_counter
      subscription_sub_periods.without_invoice.billable.each { |sp| sp.send(:create_and_send_invoice!) }
      downgrade_paypal! if automatic_downgrading? and may_downgrade_paypal?
    end
  end
end
