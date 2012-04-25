class SubscriptionPlan < ActiveRecord::Base

  include ScopedSearch::Model
  include RoleModel
  include CommonSubscriptions
  include PaypalPayment

  ROLES = [:supplier, :category_supplier, :member]

  roles ROLES

  PAYMENT_BILLING_TYPE = [
    [:at_start, true],
    [:at_end, false]
  ]

  DISABLE_PAYPAL_SUBSCRIPTIONS = false

  validates_presence_of :name, :subscription_period, :billing_cycle, :assigned_roles, :currency_id, :currency, :seller, :seller_id
  validates_presence_of :billing_period, :unless => :use_online_payment?
  validates_numericality_of :subscription_period, :greater_than_or_equal_to => 0
  validates_numericality_of :billing_period, :less_than => :billing_cycle, :if => Proc.new { |sp| sp.billing_cycle.to_i > 0 and !sp.use_online_payment? }
  validates_numericality_of :lockup_period, :free_period, :allow_nil => true
  validates_numericality_of :billing_cycle, :greater_than => 0, :less_than_or_equal_to => :subscription_period, :if => Proc.new{|sp| sp.subscription_period.to_i > 0}
  validates_numericality_of :billing_cycle, :equal_to => 0, :if => Proc.new{|sp| sp.subscription_period.to_i == 0}
  validates_presence_of :automatic_downgrade_subscription_plan_id, :if => Proc.new { |sp| sp.use_online_payment? and sp.automatic_downgrading }
  validate :check_roles
  validate :subscription_period_in_context_of_billing_cycle
  validates_associated :subscription_plan_lines
  validates_numericality_of :payment_retries, :greater_than => 0, :if => Proc.new { |sp| sp.use_online_payment? }

  has_many :subscription_plan_lines, :as => :resource, :dependent => :destroy
  has_many :subscriptions
  has_many :users, :through => :subscriptions, :source => :user
  has_one :invoice_email_template, :as => :resource, :class_name => "EmailTemplate", :conditions => "uniq_id = 'invoice'", :dependent => :destroy
  belongs_to :currency
  belongs_to :seller
  has_one :automatic_downgrade_subscription_plan, :class_name => "SubscriptionPlan", :foreign_key => "automatic_downgrade_subscription_plan_id"

  after_save :check_email_templates
  before_save :clear_additional_features_for_member
  before_validation :set_billing_cycle
  before_destroy :check_free_for_role  

  accepts_nested_attributes_for :subscription_plan_lines, :allow_destroy => true

  scope :with_keyword, lambda { |q| where("lower(name) like ?", "%#{q.downcase}%") }
  scope :active, where(:is_active => true)
  scope :only_public, where(:is_public => true)
  scope :exclude_free, lambda{ |exclude| exclude ? where("billing_price > 0.0") : where("") }
  scope :include_online_payment, lambda{ |include| include ? where("") : where("use_online_payment IS FALSE") }
  scope :exclude_current_plan, lambda{ |plan| where("billing_price <> ? and id <> ?", plan.billing_price.to_f, plan.id)}
  scope :free, where(:subscription_period => 0)
  scope :for_role, lambda { |role| where("roles_mask & #{2**SubscriptionPlan.valid_roles.index(role.to_sym)} > 0 ") }
  scope :for_roles, lambda { |roles| where( roles.map { |r| "roles_mask & #{2**SubscriptionPlan.valid_roles.index(r.to_sym)} > 0" }.join(" AND ") ) unless roles.empty? }
  scope :ascend_by_billing_price, order("billing_price")
  scope :without_online_payment, where(:use_online_payment => false)

  acts_as_newsletter_source

  private

  def subscription_period_in_context_of_billing_cycle
    errors.add(:subscription_period, :must_divide_by, :number => billing_cycle) if subscription_period.to_i > 0 and (subscription_period % billing_cycle) > 0
  end

  def set_billing_cycle
    self.billing_cycle = subscription_period if billing_cycle.to_i.eql?(0)
    true
  end
  
  def check_free_for_role
    assigned_roles.each do |role|
      return false if SubscriptionPlan.free.for_role(role).count.eql?(1)
    end
  end  

  def check_email_templates
    unless invoice_email_template
      global_template = EmailTemplate.global.where(:uniq_id => 'invoice').first
      self.invoice_email_template = global_template.clone
      global_template.translations.each do |translation|
        self.invoice_email_template.translations << translation.clone
      end
      self.save
    end
  end

  def check_roles
    if has_role?(:member) and (has_role?(:supplier) or has_role?(:category_supplier))
      errors.add(:assigned_roles, I18n.t("models.subscription_plan_incorrect_roles_set"))
      return false
    end
    true
  end

  def clear_additional_features_for_member
    if has_role?(:member)
      self.team_buyers = false
      self.big_buyer = false
      self.deal_maker = false
      self.newsletter_manager = false
    elsif has_any_role?(:supplier, :category_supplier)
      self.premium_deals = false
    end
    true
  end

  def cache_prices
    self.billing_price = total_billing
  end

  public

  def roles_as_text
    roles.to_a.map { |r| r.to_s.humanize }.join(', ')
  end

  def assigned_roles
    roles.to_a
  end

  def assigned_roles=(_roles)
    self.roles = _roles
  end

  def has_free_period?
    free_period.to_i > 0
  end

  def free_period_can_be_applied_to?(user)
    has_free_period? and user.has_free_period_available?
  end

  def total_brutto_billing_for_sub_period(user)
    total = subscription_plan_lines.sum(:price)
    vat_rate = user.not_charge_vat? ? 0 : seller.vat_rate
    vat_rate > 0 ? total + (total * BigDecimal(vat_rate.to_s).div(100,4)) : total
  end
end
