class Subscription < ActiveRecord::Base

  include CommonSubscriptions

  has_many :subscription_plan_lines, :as => :resource, :dependent => :destroy
  belongs_to :user
  belongs_to :subscription_plan

  before_create :apply_time_constraints

  acts_as_list :scope => :user_id
  scope :active, lambda { where("is_active = ? and ((end_date IS NULL and billing_cycle = 0) or end_date >= ?)", true, Date.today) }

  include AASM

  aasm_initial_state Proc.new { |subscription| subscription.initial_state }

  aasm_state :normal
  aasm_state :lockup
  aasm_state :upgraded, :enter => :perform_upgrade
  aasm_state :downgraded, :enter => :perform_downgrade
  aasm_state :cancelled, :enter => :perform_cancelled
  aasm_state :cancelled_during_lockup, :enter => :perform_cancelled_during_lockup
  aasm_state :penalty, :enter => :perform_penalty
  aasm_state :non_cancelable
  aasm_state :extended, :enter => :perform_extend
  aasm_state :upgraded_from_penalty, :enter => :perform_upgrade_from_penalty

  aasm_event :enter_lockup do
    transitions :from => [:normal, :penalty, :non_cancelable], :to => :lockup
  end

  aasm_event :upgrade do
    transitions :from => [:normal, :lockup], :to => :upgraded
  end

  aasm_event :downgrade do
    transitions :from => [:normal, :penalty], :to => :downgraded
  end

  aasm_event :cancel do
    transitions :from => :normal, :to => :cancelled
  end

  aasm_event :cancel_during_lockup do
    transitions :from => :lockup, :to => :cancelled_during_lockup
  end

  aasm_event :extend do
    transitions :from => [:normal, :lockup, :penalty, :non_cancelable], :to => :extended
  end

  aasm_event :upgrade_from_penalty do
    transitions :from => [:penalty, :non_cancelable], :to =>  :upgraded_from_penalty
  end

  def initial_state
    last_subscription = user.subscriptions.last
    if last_subscription.aasm_state == :canceled_during_lockup
      :penalty
    elsif last_subscription.aasm_state == :upgraded_from_penalty
      :non_cancelable
    else
      :normal
    end
  end

  private

  def apply_time_constraints
    if start_date.blank? and end_date.blank?
      self.start_date = Date.today
      if billing_cycle > 0
        self.end_date = Date.today + billing_cycle.weeks + free_period.to_i.weeks
        self.billing_date = end_date + billing_period.weeks
      end
    end
  end

  public

  def self.clone_from_subscription_plan!(subscription_plan, user)
    user.active_subscription.cancel!(true) if user.active_subscription
    subscription = Subscription.new(:user => user)
    subscription_plan.attributes.keys.except(["id", "roles_mask", "created_at", "updated_at", "billing_price", "is_active"]).each do |method|
      subscription.send("#{method}=".to_sym, subscription_plan.send(method.to_sym))
    end
    subscription.subscription_plan = subscription_plan
    subscription_plan.subscription_plan_lines.each do |line|
      subscription.subscription_plan_lines << line.clone
    end
    subscription.save
    subscription
  end

  def cancel!(force_cancel=false)
    if payable? or force_cancel
      self.cancelled_at = Time.now
      self.save
      user.update_attribute(:assign_free_subscription_plan, true) unless force_cancel
    end
    true
  end

  def invoiced?
    !invoiced_at.blank?
  end

  def apply_restrictions!
    u = user.with_role
    u.big_buyer = big_buyer?
    u.team_buyers = team_buyers?
    u.deal_maker_role_enabled = deal_maker?
    u.save
  end

  def can_be_downgraded_to?(subscription_plan)
    can_be_downgraded? and subscription_plan.total_billing < total_billing
  end

  def can_be_upgraded_to?(subscription_plan)
    can_be_upgraded? and subscription_plan.total_billing >= total_billing
  end
end
