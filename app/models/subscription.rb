class Subscription < ActiveRecord::Base

  include CommonSubscriptions

  has_many :subscription_plan_lines, :as => :resource, :dependent => :destroy
  belongs_to :user
  belongs_to :subscription_plan
  belongs_to :currency
  belongs_to :seller

  acts_as_list :scope => :user_id
  scope :active, lambda { where("is_active = ? and ((end_date IS NULL and billing_cycle = 0) or end_date >= ?)", true, Date.today) }
  scope :billable, where("billing_cycle > 0 AND billing_date IS NOT NULL AND billing_date <= current_date AND invoiced_at IS NULL")

  attr_accessor :next_subscription_plan
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

  aasm_event :enter_lockup do
    transitions :from => [:normal, :penalty, :non_cancelable], :to => :lockup, :guard => :lockup_period_started?
  end

  aasm_event :upgrade do
    transitions :from => [:normal, :lockup], :to => :upgraded
  end

  aasm_event :downgrade do
    transitions :from => [:normal, :penalty], :to => :downgraded
  end

  aasm_event :cancel do
    transitions :from => :normal, :to => :cancelled, :guard => :can_be_cancelled?
  end

  aasm_event :cancel_during_lockup, :after => :perform_cancelled_during_lockup do
    transitions :from => :lockup, :to => :cancelled_during_lockup
  end

  aasm_event :prolong do
    transitions :from => [:normal, :lockup, :penalty, :non_cancelable], :to => :prolonged, :guard => :can_be_prolonged?
  end

  aasm_event :upgrade_from_penalty, :after => :perform_upgrade_from_penalty do
    transitions :from => [:penalty, :non_cancelable], :to =>  :upgraded_from_penalty
  end

  def initial_state
    last_subscription = user.subscriptions.last
    if last_subscription and last_subscription.cancelled_during_lockup?
      :penalty
    elsif last_subscription and last_subscription.upgraded_from_penalty?
      :non_cancelable
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
    if billing_cycle > 0
      self.end_date = start_date + billing_cycle.weeks
      if free_period_can_be_applied?
        self.end_date =  end_date + free_period.weeks
        CompanyVat.create(:vat_number => user.vat_number.strip)
      end
      self.billing_date = end_date + billing_period.weeks
    end
  end

  def cache_prices
    self.billing_price = total_billing
    self.euro_billing_price = currency.to_euro(billing_price)
  end

  def cache_prices!
    cache_prices
    save!
  end

  def self.clone_from_subscription_plan!(subscription_plan, user, start_date=nil)
    subscription = Subscription.new(:user => user)
    subscription_plan.attributes.keys.except(["id", "roles_mask", "created_at", "updated_at", "billing_price", "is_active"]).each do |method|
      subscription.send("#{method}=".to_sym, subscription_plan.send(method.to_sym))
    end
    subscription.subscription_plan = subscription_plan
    subscription_plan.subscription_plan_lines.each do |line|
      subscription.subscription_plan_lines << line.clone
    end
    subscription.apply_time_constraints(start_date ? start_date : Date.today)
    subscription.cache_prices
    subscription.save
    subscription
  end

  def recalculate_subscription_plan_lines(new_end_date, is_free_period)
    unless is_free?
      total_days = billing_cycle*7
      paid_days = (new_end_date - start_date).to_i
      paid_days -= free_period*7 if is_free_period

      subscription_plan_lines.each do |spl|
        spl.recalculate(total_days, paid_days)
      end
    end
  end

  def perform_cancel
    self.recalculate_subscription_plan_lines(Date.today-1, is_free_period_applied?)
    self.end_date = Date.today-1
    self.cancelled_at = Time.now
    self.class.clone_from_subscription_plan!(SubscriptionPlan.active.free.for_role(user.role).first, user)
  end

  def perform_cancelled_during_lockup
    self.cancelled_at = Time.now
    self.class.clone_from_subscription_plan!(self.subscription_plan, user, end_date+1)
  end

  def perform_upgrade
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
    self.class.clone_from_subscription_plan!(prolongs_as_free ? SubscriptionPlan.active.free.for_role(user.role).first : self.subscription_plan, user, end_date+1)
  end

  def perform_upgrade_from_penalty
    self.recalculate_subscription_plan_lines(Date.today-1, is_free_period_applied?)
    self.end_date = Date.today-1
    self.class.clone_from_subscription_plan!(next_subscription_plan, user)
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

  def is_free?
    !payable?
  end

  def can_be_prolonged?
    payable? and end_date < Date.today
  end

  def can_be_cancelled?
    payable? and start_date != Date.today
  end

  def can_cancel_at
    if payable? and normal?
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
    free_period.to_i > 0 and end_date and ((end_date - start_date)/7).to_i == (billing_cycle.to_i + free_period.to_i)
  end

  def is_today_in_free_period?
    is_free_period_applied? and Date.today <= (start_date + free_period.weeks) and Date.today >= start_date
  end

  def free_subscription_end_date
    is_free_period_applied? ? start_date + free_period.weeks : nil
  end

  def will_prolong?
    payable?
  end

  def self.auto_prolong
    User.all_subscribers.each(&:active_subscription)
  end
end
