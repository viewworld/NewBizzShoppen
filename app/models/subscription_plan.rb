class SubscriptionPlan < ActiveRecord::Base

  include ScopedSearch::Model
  include RoleModel
  include CommonSubscriptions

  ROLES = [:supplier, :category_supplier, :member]

  roles ROLES

  validates_presence_of :name, :subscription_period, :billing_cycle, :billing_period, :assigned_roles, :currency_id, :currency, :seller, :seller_id
  validates_numericality_of :billing_cycle
  validates_numericality_of :billing_period, :greater_than_or_equal_to => 0
  validates_numericality_of :lockup_period, :free_period, :allow_nil => true
  validates_numericality_of :billing_cycle, :greater_than_or_equal_to => 1, :less_than_or_equal_to => Proc{|sp| }
  validate :check_roles

  has_many :subscription_plan_lines, :as => :resource, :dependent => :destroy
  has_many :subscriptions
  has_one :invoice_email_template, :as => :resource, :class_name => "EmailTemplate", :conditions => "uniq_id = 'invoice'", :dependent => :destroy
  belongs_to :currency
  belongs_to :seller

  after_save :check_email_templates
  before_save :clear_additional_features_for_member, :cache_total_billing

  accepts_nested_attributes_for :subscription_plan_lines, :allow_destroy => true

  scope :with_keyword, lambda { |q| where("lower(name) like ?", "%#{q.downcase}%") }
  scope :active, where(:is_active => true)
  scope :exclude_free, lambda{ |exclude| exclude ? where("billing_price > 0.0") : where("") }
  scope :exclude_current_plan, lambda{ |plan| where("billing_price <> ? and id <> ?", plan.billing_price, plan.id)}
  scope :free, where(:billing_cycle => 0)
  scope :for_role, lambda { |role| where("roles_mask & #{2**SubscriptionPlan.valid_roles.index(role.to_sym)} > 0 ") }
  scope :ascend_by_billing_price, order("billing_price")

  private

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
    end
    true
  end

  def cache_total_billing
    self.billing_price = total_billing
  end

  public

  def cache_prices!
    cache_total_billing
    save!
  end

  def roles_as_text
    roles.to_a.map { |r| r.to_s.humanize }.join(', ')
  end

  def assigned_roles
    roles.to_a
  end

  def assigned_roles=(_roles)
    self.roles = _roles
  end

  def is_free?
    !payable?
  end
end
