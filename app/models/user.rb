require 'app/modules/role_change'

class User < ActiveRecord::Base

  self.abstract_class = true
  ajaxful_rater
  include EmailTemplateEditor

  ROLES_PRIORITY = [:admin, :call_centre, :agent, :call_centre_agent, :member, :category_supplier, :supplier, :lead_supplier, :lead_user, :translator, :deal_maker]
  DEAL_VALUE_RANGE = [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000]
  BASIC_USER_ROLES_WITH_LABELS = [['Administrator', 'admin'], ['Agent', 'agent'], ['Supplier', 'supplier'], ['Call centre', 'call_centre'], ['Member', 'member'], ['Category supplier', 'category_supplier']]
  ADDITIONAL_USER_ROLES_WITH_LABELS = [['Lead user', "lead_user"], ['Lead supplier', "lead_supplier"], ["Call centre agent", "call_centre_agent"]]

  NOT_CERTIFIED = 0
  BRONZE_CERTIFICATION = 1
  SILVER_CERTIFICATION = 2
  GOLD_CERTIFICATION = 3
  NOT_CERTIFIED_LOCKED = 10
  BRONZE_CERTIFICATION_LOCKED = 11
  SILVER_CERTIFICATION_LOCKED = 12
  GOLD_CERTIFICATION_LOCKED = 13
  CERTIFICATION_LEVELS = [NOT_CERTIFIED, BRONZE_CERTIFICATION, SILVER_CERTIFICATION, GOLD_CERTIFICATION, NOT_CERTIFIED_LOCKED, BRONZE_CERTIFICATION_LOCKED, SILVER_CERTIFICATION_LOCKED, GOLD_CERTIFICATION_LOCKED]

  LEAD_NOTIFICATION_INSTANT = 0
  LEAD_NOTIFICATION_ONCE_PER_DAY = 1
  LEAD_NOTIFICATION_ONCE_PER_WEEK = 2
  LEAD_NOTIFICATION_TYPES = [LEAD_NOTIFICATION_INSTANT, LEAD_NOTIFICATION_ONCE_PER_DAY, LEAD_NOTIFICATION_ONCE_PER_WEEK]

  BLACK_LISTED_ATTRIBUTES = [:paypal_email, :bank_swift_number, :bank_iban_number]

  SUBSCRIBER_TYPE_AD_HOC = "ad-hoc"
  SUBSCRIBER_TYPE_SUBSCRIBER = "subscriber"
  SUBSCRIBER_TYPES = [['Ad-hoc', SUBSCRIBER_TYPE_AD_HOC], ['Subscriber', SUBSCRIBER_TYPE_SUBSCRIBER]]

  include RoleModel
  include ScopedSearch::Model
  include RoleChange

  devise :database_authenticatable, :registerable, :confirmable, :lockable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :rpx_connectable

  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  roles :admin, :agent, :call_centre, :call_centre_agent, :supplier, :lead_supplier, :lead_user, :member, :category_supplier, :translator, :deal_maker

  validates_presence_of :email
  validates_presence_of :first_name, :last_name, :if => :validate_first_and_last_name?
  validates_uniqueness_of :email
  validate :payout_information_is_complete

  has_many :subaccounts, :class_name => "User", :foreign_key => "parent_id"
  has_many :owned_lead_requests, :class_name => 'LeadRequest', :foreign_key => :owner_id
  has_many :invoices
  has_many :user_session_logs
  belongs_to :currency
  belongs_to :user, :class_name => "User", :foreign_key => "parent_id", :counter_cache => :subaccounts_counter
  belongs_to :bank_account, :foreign_key => :bank_account_id, :primary_key => :id, :class_name => 'BankAccount'
  belongs_to :vat_rate, :foreign_key => :country, :primary_key => :country_id
  has_many :lead_templates,
           :as => :creator,
           :dependent => :destroy
  has_many :results,
           :as => :creator,
           :dependent => :destroy
  has_many :blocked_conversations, :foreign_key => "agent_id"
  has_many :comment_readers
  has_many :read_comments, :through => :comment_readers, :source => :comment
  belongs_to :contact
  has_many :deal_comment_threads, :class_name => "Comment", :foreign_key => "user_id"
  has_many :email_bounces, :class_name => "ArchivedEmail", :foreign_key => :to, :primary_key => :email, :conditions => "status = #{ArchivedEmail::BOUNCED}"
  has_many :subscriptions
  has_many :subscription_plans, :through => :subscriptions
  belongs_to :company_unique_category, :class_name => "LeadCategory", :foreign_key => "deal_category_id"
  has_many :delayed_jobs, :class_name => '::Delayed::Job', :foreign_key => :queue, :primary_key => :queue, :order => "created_at DESC"
  has_many :notifications, :as => :notificable

  alias_method :parent, :user

  scope :with_suppliers, where("roles_mask & #{2**User.valid_roles.index(:supplier)} > 0 ")
  scope :with_agents, where("(roles_mask & #{2**User.valid_roles.index(:agent)} > 0) or (roles_mask & #{2**User.valid_roles.index(:call_centre_agent) } > 0) or (roles_mask & #{2**User.valid_roles.index(:member)} > 0) or (roles_mask & #{2**User.valid_roles.index(:call_centre) } > 0)")
  scope :with_possible_deal_admins, where("(roles_mask & #{2**User.valid_roles.index(:agent)} > 0) or (roles_mask & #{2**User.valid_roles.index(:call_centre_agent) } > 0) or (roles_mask & #{2**User.valid_roles.index(:call_centre) } > 0)").order("email ASC")
  scope :with_agents_without_call_centres, where("(roles_mask & #{2**User.valid_roles.index(:agent)} > 0) or (roles_mask & #{2**User.valid_roles.index(:call_centre_agent) } > 0) or (roles_mask & #{2**User.valid_roles.index(:member)} > 0)")
  scope :with_call_centre_agents, lambda { |call_centre| where("(roles_mask & #{2**User.valid_roles.index(:call_centre_agent)} > 0) and parent_id = ?", call_centre.id) }
  scope :with_call_centres, where("roles_mask & #{2**User.valid_roles.index(:call_centre)} > 0")
  scope :with_role, lambda { |role| where("roles_mask & #{2**User.valid_roles.index(role.to_sym)} > 0 ") }
  scope :with_roles_except, lambda { |roles| where( roles.map { |r| "NOT(roles_mask & #{2**User.valid_roles.index(r.to_sym)} > 0)" }.join(" AND ") ) }
  scope :with_keyword, lambda { |q| where("lower(first_name) like :keyword OR lower(last_name) like :keyword OR lower(email) like :keyword or lower(company_name) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :with_subaccounts, lambda { |parent_id| where("parent_id = ?", parent_id) }
  scope :without_locked, where("locked_at IS NULL")

  scope :requestees_for_lead_request_owner, lambda { |owner| select("DISTINCT(users.id), users.*").where("lead_purchases.requested_by IS NOT NULL and lead_purchases.owner_id = ? and users.parent_id = ?", owner.id, owner.id).joins("RIGHT JOIN lead_purchases on lead_purchases.requested_by=users.id") }
  scope :assignees_for_lead_purchase_owner, lambda { |owner| select("DISTINCT(users.id), users.*").where("lead_purchases.requested_by IS NULL and lead_purchases.owner_id = ? and accessible_from IS NOT NULL and users.parent_id = ?", owner.id, owner.id).joins("RIGHT JOIN lead_purchases on lead_purchases.assignee_id=users.id") }


  scope :join_lead_purchases_and_leads, joins("INNER JOIN lead_purchases ON lead_purchases.assignee_id=users.id").joins("INNER JOIN leads on leads.id=lead_purchases.lead_id")
  scope :with_completed_leads, lambda { |assignee| select("leads.id").where("assignee_id = ? and state = ?", assignee.id, 3).join_lead_purchases_and_leads }
  scope :with_requested_leads, lambda { |requestee| select("leads.id").where("lead_purchases.assignee_id IS NULL and lead_purchases.requested_by = ?", requestee.id).joins("INNER JOIN lead_purchases ON lead_purchases.requested_by=users.id").joins("INNER JOIN leads on leads.id=lead_purchases.lead_id") }
  scope :with_assigned_leads_time_ago, lambda { |assignee, time| select("leads.id").where("assignee_id = ? and lead_purchases.assigned_at >= ?", assignee.id, time).join_lead_purchases_and_leads }
  scope :with_assigned_leads_total, lambda { |assignee| select("leads.id").where("assignee_id = ?", assignee.id).join_lead_purchases_and_leads }
  scope :with_lead_creators_for, lambda { |parent| select("DISTINCT(users.id), users.*").where("users.parent_id = ?", parent.id).joins("INNER JOIN leads ON leads.creator_id=users.id") }
  scope :assignees_for_lead_purchase_owner, lambda { |owner| select("DISTINCT(users.id), users.*").where("lead_purchases.requested_by IS NULL and lead_purchases.owner_id = ? and accessible_from IS NOT NULL and users.parent_id = ?", owner.id, owner.id).joins("RIGHT JOIN lead_purchases on lead_purchases.assignee_id=users.id") }
  scope :with_leads, select("DISTINCT(email), users.*").joins("RIGHT JOIN leads on users.id=leads.creator_id")
  scope :within_accessible_categories, lambda { |supplier| where("leads.category_id NOT IN (?)", supplier.accessible_categories_ids) }
  scope :right_join_leads, joins("RIGHT JOIN leads on users.id=leads.creator_id")
  scope :screen_name_and_id_with_leads, right_join_leads.select("DISTINCT(users.id),users.company_name, users.first_name, users.company_name")
  scope :with_leads_within_categories, lambda { |category_ids| right_join_leads.where("leads.category_id IN (?)", category_ids.to_a) }

  scope :assigned_to_campaigns, select("DISTINCT(users.id), users.*").joins("inner join campaigns_users on users.id=campaigns_users.user_id")
  scope :with_results, joins("inner join call_results on users.id=call_results.creator_id")
  scope :for_campaigns, lambda { |campaign_ids| where("campaigns_users.campaign_id in (?)", campaign_ids) unless campaign_ids.empty? }
  scope :created_by, lambda { |user_id| where(:created_by => user_id) }
  scope :all_subscribers, where("roles_mask & #{2**User.valid_roles.index(:lead_supplier)} > 0 OR roles_mask & #{2**User.valid_roles.index(:member)} > 0")

  scoped_order :id, :roles_mask, :first_name, :last_name, :email, :age, :department, :mobile_phone, :completed_leads_counter, :leads_requested_counter,
               :leads_assigned_month_ago_counter, :leads_assigned_year_ago_counter, :total_leads_assigned_counter, :leads_created_counter,
               :leads_volume_sold_counter, :leads_revenue_counter, :leads_purchased_month_ago_counter, :leads_purchased_year_ago_counter,
               :leads_rated_good_counter, :leads_rated_bad_counter, :leads_not_rated_counter, :leads_rating_avg, :certification, :payout,
               :revenue_counter, :leads_purchased_counter, :leads_volume_sold_counter, :leads_revenue_counter, :unpaid_leads_counter, :company_name

  attr_protected :payout, :locked, :can_edit_payout_information, :paypal_email, :bank_swift_number, :bank_iban_number, :skip_email_verification, :cancel_subscription

  attr_accessor :agreement_read, :locked, :skip_email_verification, :deal_maker_role_enabled_flag, :send_invitation, :auto_generate_password, :email_materials, :cancel_subscription, :subscription_plan_id, :assign_free_subscription_plan

  before_save :handle_locking, :refresh_certification_of_call_centre_agents, :set_euro_billing_rate, :handle_deal_maker_enabled
  before_create :set_rss_token, :set_email_verification
  before_destroy :can_be_removed
  after_create :auto_activate
  after_save :handle_cancel_subscription
  after_create :apply_subscription_plan
  after_update :send_invitation_if_enabled
  before_update :check_vat_number
  validate :check_billing_rate, :check_subscription_plan
  before_validation :set_auto_generated_password_if_required, :set_role
  after_initialize :set_auto_buy_enabled

  liquid :email, :confirmation_instructions_url, :reset_password_instructions_url, :social_provider_name, :category_supplier_category_home_url,
         :screen_name, :first_name, :last_name, :home_page_url
  require 'digest/sha1'

  private

  def set_email_verification
    if new_record?
      if (has_any_role?(:supplier, :category_supplier, :lead_buyer, :lead_user) and Settings.email_verification_for_suppliers == "0") or
         (has_role?(:member) and Settings.email_verification_for_members == "0")
        self.skip_email_verification = "1"
      end
    end
  end

  def handle_deal_maker_enabled
    if has_role?(:deal_maker) and !deal_maker_role_enabled
      self.roles.delete(:deal_maker)
    elsif !has_role?(:deal_maker) and deal_maker_role_enabled
      self.roles << :deal_maker
    end
  end

  def auto_activate
    confirm! if skip_email_verification == "1"
  end

  def validate_first_and_last_name?
    true
  end

  def mass_assignment_authorizer
    if self.can_edit_payout_information
      self.class.protected_attributes.reject! { |a| BLACK_LISTED_ATTRIBUTES.include?(a.to_sym) }
      self.class.protected_attributes
    else
      super
    end
  end

  def payout_information_is_complete
    if paypal_email.present? and bank_swift_number.present? and bank_iban_number.present?
      errors.add(:paypal_email, :invalid)
    elsif paypal_email.blank? and ((bank_swift_number.present? and bank_iban_number.blank?) or (bank_swift_number.blank? and bank_iban_number.present?))
      errors.add(:bank_swift_number, :blank) if bank_swift_number.blank?
      errors.add(:bank_iban_number, :blank) if bank_iban_number.blank?
    end
  end

  def can_be_removed
    casted_obj = self.send(:casted_class).find(id)
    [:leads, :lead_purchases, :assigned_lead_purchases, :lead_requests, :leads_in_cart, :deals, :requested_deals, :campaigns, :contacts, :subaccounts, :invoices].detect do |method|
      casted_obj.respond_to?(method) and !casted_obj.send(method).empty?
    end.nil? and (!active_subscription or (active_subscription.is_free? and subscriptions.detect { |s| s.payable? and !s.invoiced?}.nil?))
  end

  def handle_locking
    if locked
      self.locked_at = locked == "unlock" ? nil : Time.now
      self.cancel_subscription = true if locked_at and active_subscription and !active_subscription.is_free?
    end
  end

  def set_rss_token
    self.rss_token = generate_token
  end

  def generate_token(size=40)
    charset = (0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a
    (0...size).map { charset[rand(charset.size)] }.join+id.to_s
  end

  def set_role
    if !([self.class.const_get("ROLES")] - self.roles.to_a).empty? and new_record?
      self.roles = self.roles.to_a | [self.class.const_get("ROLES")]
    end
    true
  end

  def casted_class
    "User::#{role.to_s.camelize}".constantize
  end

  def deliver_email_template(uniq_id)
    TemplateMailer.new(email, uniq_id.to_sym, country, {:user => self.with_role, :sender_id => nil}).deliver!
  end

  def check_billing_rate
    if billing_rate.to_i > 0 and currency.blank?
      self.errors.add(:currency_id, :blank)
    end
  end

  def set_euro_billing_rate
    if currency.present? and billing_rate.to_i > 0 and (billing_rate_changed? or currency_id_changed?)
      self.euro_billing_rate = currency.to_euro(billing_rate)
    end
  end

  def send_invitation_if_enabled
    send_invitation_email if ActiveRecord::ConnectionAdapters::Column.value_to_boolean(send_invitation)
  end

  def set_auto_generated_password_if_required
    if ActiveRecord::ConnectionAdapters::Column.value_to_boolean(auto_generate_password)
      new_password = generate_token(12)
      self.password = new_password
      self.password_confirmation = new_password
    end
  end

  def handle_cancel_subscription
    if ActiveRecord::ConnectionAdapters::Column.value_to_boolean(cancel_subscription) and active_subscription
      cancel_subscription!
      self.cancel_subscription = nil
    end
  end

  def select_subscription_plan
    chosen_subscription = nil
    if subscription_plan_id and subscription_plan = SubscriptionPlan.find_by_id(subscription_plan_id) and subscription_can_be_applied?(subscription_plan)
      chosen_subscription = subscription_plan
    elsif ActiveRecord::ConnectionAdapters::Column.value_to_boolean(assign_free_subscription_plan)
      chosen_subscription = SubscriptionPlan.free.for_role(role).first
      chosen_subscription.is_active = true
    end

    chosen_subscription
  end

  def check_subscription_plan
    if subscription_required? and ((!active_subscription or subscription_plan_id) and select_subscription_plan.nil?)
      errors.add(:subscription_plan_id, I18n.t("models.user.subscription_plan_not_specified"))
      return false
    end
    true
  end

  def apply_subscription_plan
    if (subscription_plan_id or assign_free_subscription_plan) and subscription_required?
      apply_subscription!(select_subscription_plan)
      self.subscription_plan_id = nil
      self.assign_free_subscription_plan = nil
      true
    end
  end

  def check_vat_number
    if vat_number_changed? and vat_number.to_s.strip.present? and company_vat = CompanyVat.where("lower(vat_number) like ?", vat_number_was.to_s.strip.downcase).first
      company_vat.update_attribute(:vat_number, vat_number)
    end
  end

  def secretize_password!
    self.password = "secret"
    self.password_confirmation = "secret"
    self.save(:validate => false)
  end

  def self.secretize_passwords!
    all.each do |user|
      user = user.with_role
      user.password = 'secret'
      user.password_confirmation = 'secret'
      user.save!
    end
  end

  public

  def domain
    Domain.where(:site => with_role.site, :locale => I18n.locale).first || Domain.where(:site => with_role.site).with_default.first
  end

  def domain_name
    domain ? domain.name : 'fairleads.com'
  end

  def all_requested_lead_requests
    LeadRequest.where(:requested_by => (parent ? parent.subaccounts : subaccounts).with_role(:lead_user).map(&:id))
  end

  def all_purchased_lead_purchases
    user = parent || self
    user.has_role?(:supplier) ? LeadPurchase.where("owner_id = ? and accessible_from IS NOT NULL", user.id) : []
  end

  def all_requested_lead_ids
    all_requested_lead_requests.map(&:lead_id)
  end

  def all_purchased_lead_ids
    all_purchased_lead_purchases.map(&:lead_id)
  end

#TODO Manage to move to supplier :) ... if possible
  def cart
    @cart ||= Cart.new(User::LeadSupplier.find(self.id))
  end

  def self.inherited(subclass)
    super
    subclass.send(:default_scope, with_role(subclass.name.split('::').last.tableize.singularize)) unless subclass.name.split('::').last.tableize.singularize == "abstract"
  end

  # TODO find out which roles are invoiceable
  def self.invoiceable
    self.with_roles_except([:admin]).reject { |u| !defined? u.with_role.address }
  end

  def role
    roles.sort_by { |r| User::ROLES_PRIORITY.index(r) }.first
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def send_confirmation_instructions
    generate_confirmation_token if self.confirmation_token.nil?
    deliver_email_template("confirmation_instructions") unless ActiveRecord::ConnectionAdapters::Column.value_to_boolean(skip_email_verification)
  end

  def send_reset_password_instructions
    generate_reset_password_token!
    deliver_email_template("reset_password_instructions")
  end

  def confirmation_instructions_url
    "http://#{domain_name}/users/confirmation?confirmation_token=#{confirmation_token}"
  end

  def reset_password_instructions_url
    "http://#{domain_name}/users/password/edit?reset_password_token=#{reset_password_token}"
  end

  def roles_as_text
    selected_role = (BASIC_USER_ROLES_WITH_LABELS + ADDITIONAL_USER_ROLES_WITH_LABELS).detect { |r| r.last == role.to_s }
    selected_role.blank? ? "" : selected_role.first
  end

  def self.role_as_text(_role)
    selected_role = BASIC_USER_ROLES_WITH_LABELS.detect { |r| r.last == _role.to_s }
    selected_role.blank? ? "" : selected_role.first
  end

  def subscriber_type_as_text
    selected = SUBSCRIBER_TYPES.detect { |t| t.last == subscriber_type }
    selected ? selected.first : ""
  end

  def refresh_supplier_counters!
    self.leads_purchased_counter = LeadPurchase.with_purchased_by(self).size
    if big_buyer?
      self.unpaid_leads_counter = LeadPurchase.with_not_invoiced.where("owner_id = ?", id).map(&:currency_id).size
    end
    self.save
  end

  def refresh_subaccounts_counters!
    self.completed_leads_counter = User.with_completed_leads(self).size
    self.leads_requested_counter = User.with_requested_leads(self).size
    self.leads_assigned_month_ago_counter = User.with_assigned_leads_time_ago(self, 30.days.ago).size
    self.leads_assigned_year_ago_counter = User.with_assigned_leads_time_ago(self, 12.months.ago).size
    self.total_leads_assigned_counter = User.with_assigned_leads_total(self).size
    self.save
  end

  def refresh_call_centre_counters!
    self.leads_created_counter = Lead.with_created_by_call_centre(self).size
    self.leads_volume_sold_counter = LeadPurchase.with_volume_sold_by(self).size
    self.leads_revenue_counter = Lead.with_revenue_by(self).first.id || 0
    self.refresh_certification_level
    self.save
  end

  def refresh_agent_counters!
    self.leads_created_counter = Lead.with_created_by(id).size
    self.leads_volume_sold_counter = LeadPurchase.with_volume_sold_by(self).size
    self.leads_revenue_counter = Lead.with_revenue_by(self).first.id || 0
    self.leads_purchased_month_ago_counter = LeadPurchase.with_purchased_time_ago_by(self, 30.days.ago).size
    self.leads_purchased_year_ago_counter = LeadPurchase.with_purchased_time_ago_by(self, 12.months.ago).size
    self.leads_rated_good_counter = Lead.with_rated_good_by(self).size
    self.leads_rated_bad_counter = Lead.with_rated_bad_by(self).size
    self.leads_not_rated_counter = Lead.with_not_rated_by(self).size
    self.leads_rating_avg = LeadPurchase.with_rating_avg_by(self).first.id || 0
    unless has_role?(:call_centre_agent)
      self.refresh_certification_level
    end
    self.save
  end

  def self.refresh_agents_certification_level
    (User::Agent.all + User::CallCentre.all).each do |user|
      user.refresh_certification_level
      user.save
    end
  end

  def refresh_certification_of_call_centre_agents
    if has_role?(:call_centre) and certification_level_changed?
      User::CallCentreAgent.where(:id => subaccount_ids).each do |cc_agent|
        cc_agent.certification_level = read_attribute(:certification_level)
        cc_agent.save
      end
    end
  end

  def certification_level
    has_role?(:call_centre_agent) ? parent.certification_level : read_attribute(:certification_level) % 10
  end

  def refresh_certification_level
    self.certification_level = calculate_certification_level if read_attribute(:certification_level).to_i < NOT_CERTIFIED_LOCKED
  end

  def certification_level_ratio
    user_ids = has_any_role?(:call_centre, :call_centre_agent) ? (has_role?(:call_centre) ? subaccount_ids : parent.subaccount_ids) : id
    Lead.joins(:lead_purchases).where(:creator_id => user_ids, :creator_type => has_any_role?(:call_centre, :call_centre_agent) ? "User::CallCentreAgent" : self.class.to_s).count
  end

  def calculate_certification_level
    if certification_level_ratio >= Settings.certification_level_2.to_i
      GOLD_CERTIFICATION
    elsif certification_level_ratio >= Settings.certification_level_1.to_i
      SILVER_CERTIFICATION
    else
      BRONZE_CERTIFICATION
    end
  end

  def has_accessible_categories?
    parent.present? and has_any_role?(:lead_supplier, :lead_user) and User::Supplier.find(parent_id).category_interests.present?
  end

  def can_save_category_interests?
    has_any_role?(:supplier)
  end

  def accessible_categories_ids
    User::Supplier.find(parent_id.blank? ? id : parent_id).category_interests.map(&:category_id)
  end

  def has_role?(r)
    roles.include?(r)
  end

  def has_one_of_roles?(*r)
    r.map { |role| has_role?(role) }.include?(true)
  end

  def to_s
    full_name
  end

  def can_create_lead_templates?
    has_any_role?(:admin, :call_centre, :agent, :call_centre_agent, :supplier)
  end

  def country_vat_rate
    (with_role.vat_rate and !not_charge_vat) ? with_role.vat_rate.rate : 0.0
  end

  def to_i
    id
  end

  def user_country
    address.country
  end

  def vat_rate
    parent.present? ? parent.with_role.address.country.vat_rate : address.country.vat_rate
  end

  def with_role
    casted_class.find(id)
  end

  #to handle menu chronology correctly
  def roles_sorted
    if has_role?(:lead_supplier)
      [:lead_supplier] + roles.select { |r| r != :lead_supplier }
    else
      roles
    end
  end

  def call_centre?
    has_role?(:call_centre)
  end

  def call_centre_agent?
    has_role?(:call_centre_agent)
  end

  def agent?
    has_any_role?([:agent, :call_centre, :call_centre_agent])
  end

  def supplier?
    has_any_role?([:supplier, :category_supplier, :lead_supplier])
  end

  def admin?
    has_role?(:admin)
  end

  def member?
    has_role?(:member)
  end

  def category_supplier?
    has_role?(:category_supplier)
  end

  def site
    :fairleads
  end

  def purchase_limit_reached?(lead, buyout=false)
    return false unless big_buyer?
    not_invoiced_cost = LeadPurchase.with_not_invoiced.where("owner_id = ?", id).map { |lp| lp.not_invoiced_euro_sum.to_f }.sum
    (not_invoiced_cost + (buyout ? lead.buyout_quantity : 1) * lead.currency.to_euro(lead.price)) >= (big_buyer_purchase_limit.to_f > 0 ? big_buyer_purchase_limit.to_f : Settings.big_supplier_purchase_limit.to_f)
  end

  def generate_login_key
    self.login_key = Digest::SHA1.hexdigest("#{created_at} -- #{id} -- #{Time.now}") unless login_key
    login_key
  end

  def generate_login_key!
    self.update_attribute(:login_key, generate_login_key)
    login_key
  end

  def clear_login_key!
    self.update_attribute(:login_key, nil)
  end

  def children
    User.where(:parent_id => self.id)
  end

  def self_and_descendants
    Array(self) + children
  end

  def can_start_new_lead_thread?
    !agent?
  end

  def can_reply_to_comment?(comment)
    true
  end

  def set_fields_for_rpx(data)
    self.email = data['verifiedEmail'] if self.email.blank?
    self.first_name = data['name']['givenName'] if self.first_name.blank?
    self.last_name = data['name']['familyName'] if self.last_name.blank?
    self.rpx_identifier = data['identifier']
    self.newsletter_on = true
    new_radnom_password = generate_token(12)
    self.password = new_radnom_password
    self.password_confirmation = new_radnom_password
    self.skip_email_verification = "1"
  end

  def can_publish_leads?
    false
  end

  def self.social_provider(rpx_identifier)
    return nil if rpx_identifier.blank?
    return "Google" if rpx_identifier.include?("www.google.com")
    return "Facebook" if rpx_identifier.include?("www.facebook.com")
    "Linked In" if rpx_identifier.include?("www.linkedin.com")
  end

  def social_provider_name
    if rpx_identifier
      User.social_provider(rpx_identifier)
    else
      I18n.t("models.user.not_linked_to_social_provider")
    end
  end

  def social_provider_ico
    case User.social_provider(rpx_identifier)
      when "Google"
        "icons/google_icon.png"
      when "Facebook"
        "icons/fb_icon.png"
      when "Linked In"
        "icons/in_icon.png"
      else
        nil
    end
  end

  def deliver_lead_notification
    unless lead_notification_type == LEAD_NOTIFICATION_INSTANT
      subscribed_categories = has_role?(:supplier) ? with_role.categories : has_any_role?(:lead_supplier, :lead_user) and parent.present? ? parent.with_role.categories : []
      unless subscribed_categories.empty?
        uniq_id = "lead_notification_#{lead_notification_type == LEAD_NOTIFICATION_ONCE_PER_DAY ? 'daily' : 'weekly'}"
        leads = Lead.for_notification(subscribed_categories, lead_notification_type)
        TemplateMailer.new(email, uniq_id.to_sym, user.with_role.address.country, {:user => self, :leads => leads, :sender_id => nil}).deliver!
      end
    end
  end

  def category_supplier_category_home_url
    if has_role?(:category_supplier)
      "http://#{domain_name}/#{with_role.parent_buying_categories.first.cached_slug}"
    end
  end

  def home_page_url
    if has_role?(:category_supplier)
      category_supplier_category_home_url
    elsif has_role?(:supplier)
      "http://#{domain_name}/supplier_home"
    elsif has_role?(:member)
      "http://#{domain_name}/"
    else
      "http://#{domain_name}/"
    end
  end

  def deal_maker_role_enabled
    if deal_maker_role_enabled_flag.nil?
      self.deal_maker_role_enabled_flag = self.has_role?(:deal_maker) ? true : false
    end
    deal_maker_role_enabled_flag
  end

  def deal_maker_role_enabled=(enabled)
    self.deal_maker_role_enabled_flag = ActiveRecord::ConnectionAdapters::Column.value_to_boolean(enabled)
  end

  def can_start_new_deal_thread?
    true
  end

  #for members and suppliers
  def send_invitation_email(new_password=nil)
    unless new_password
      new_password = generate_token(12)
      self.password = new_password
      self.send_invitation = false
      self.save(:validate => false)
    end
    template = EmailTemplate.find_by_uniq_id("#{has_role?(:member) ? 'member' : 'supplier'}_invitation")
    template = customize_email_template(template)
    TemplateMailer.new(email, template, with_role.address.present? ? with_role.address.country : Country.get_country_from_locale,
                             {:user => self.with_role, :new_password => new_password, :sender_id => nil}, assets_to_path_names(email_materials)).deliver!
  end

  def country
    if respond_to?(:address)
      return address.country if address.present?
    else
      return with_role.address.country if with_role.address.present?
    end

    Country.get_country_from_locale
  end

  def role_to_deal_namespace
    if has_role?(:admin)
      "administration"
    elsif has_role?(:supplier)
      "suppliers"
    elsif has_any_role?(:agent, :call_centre, :call_centre_agent)
      role.to_s.pluralize
    end
  end

  def role_to_campaign_template_name
    if has_role?(:category_supplier)
      "category_buyer"
    elsif has_role?(:supplier)
      "buyer"
    elsif has_role?(:member)
      "member"
    end
  end

  def deliver_welcome_email_for_upgraded_contact
    TemplateMailer.new(email, "upgraded_contact_to_#{role_to_campaign_template_name}_welcome".to_sym, with_role.address.country, {:user => self, :sender_id => nil}).deliver!
  end

  def active_subscription
    active_sub = subscriptions.where("start_date <= ? and (end_date >= ? OR end_date IS NULL)", Date.today, Date.today).order("position DESC").first
    if !active_sub and last_subscription
      last_subscription.prolong!
      active_sub = last_subscription
    end
    active_sub
  end

  def next_subscription
    subscriptions.where("start_date > ?", active_subscription.end_date).order("position ASC").first
  end

  def last_subscription
    subscriptions.order("position DESC").first
  end

  def active_subscription_plan
    active_subscription ? active_subscription.subscription_plan : nil
  end

  def next_subscription_plan
    next_subscription ? next_subscription.subscription_plan : nil
  end

  def subscription_plan_is_valid?(subscription_plan)
    subscription_plan and (subscription_plan.is_a?(Subscription) or (subscription_plan.is_a?(SubscriptionPlan) and subscription_plan.is_active)) and (subscription_plan.respond_to?(:has_role?) ? subscription_plan.has_role?(self.role.to_sym) : true)
  end

  def start_date_for_admin_change_is_valid?(start_date)
    (start_date >= Date.today) and (active_subscription.is_free? or (start_date <= active_subscription.end_date + 1.day))
  end

  def subscription_can_be_applied?(subscription_plan)
     !active_subscription and subscription_can_be_changed_to?(subscription_plan) and subscription_plan_is_valid?(subscription_plan)
  end

  def subscription_can_be_changed_to?(subscription_plan)
    subscription_plan_is_valid?(subscription_plan) and (!active_subscription or (active_subscription.can_be_downgraded_to?(subscription_plan) or active_subscription.can_be_upgraded_to?(subscription_plan)))
  end

  def apply_subscription!(subscription_plan)
    if subscription_can_be_applied?(subscription_plan)
      self.subscriptions.clone_from_subscription_plan!(subscription_plan, self)
    end
  end

  def downgrade_subscription!(subscription_plan)
    if subscription_can_be_changed_to?(subscription_plan) and active_subscription.can_be_downgraded_to?(subscription_plan)
      active_subscription.use_paypal? ? downgrade_paypal(subscription_plan, active_subscription.subscription_sub_periods.size) : downgrade_regular(subscription_plan)
    else
      self.errors.add(:base, I18n.t("subscriptions.cant_be_downgraded"))
      false
    end
  end

  def downgrade_regular(subscription_plan)
    as = active_subscription
    as.next_subscription_plan = subscription_plan
    as.downgrade!
  end

  def downgrade_paypal(subscription_plan, totalbillingcycles)
    if profile = PaypalRecurringProfile.new(active_subscription.paypal_profile_id) and profile.update_profile(:totalbillingcycles => totalbillingcycles)
      downgrade_regular(subscription_plan)
    else
      self.errors.add(:base, profile.result["L_LONGMESSAGE0"])
      false
    end
  end

  def upgrade_subscription!(subscription_plan)
    if subscription_can_be_changed_to?(subscription_plan) and active_subscription.can_be_upgraded_to?(subscription_plan)
      active_subscription.cancel_paypal_profile if active_subscription.use_paypal?
      as = active_subscription
      as.next_subscription_plan = subscription_plan
      if as.may_upgrade?
        as.upgrade!
      elsif as.may_upgrade_from_penalty?
        as.upgrade_from_penalty!
      end
    else
      self.errors.add(:base, I18n.t("subscriptions.cant_be_upgraded"))
      false
    end
  end

  def admin_change_subscription!(subscription_plan, start_date = Date.today)
    if !subscription_plan_is_valid?(subscription_plan)
      self.errors.add(:base, I18n.t("subscriptions.new_subscription_plan_is_invalid"))
      return false
    elsif !start_date_for_admin_change_is_valid?(start_date)
      self.errors.add(:base, I18n.t("subscriptions.start_date_is_invalid"))
      return false
    elsif subscriptions.future.count > 0
      self.errors.add(:base, I18n.t("subscriptions.there_are_future_subscriptions"))
      return false
    else
      as = active_subscription
      as.next_subscription_plan = subscription_plan
      as.next_subscription_plan_start_date = start_date
      as.admin_change!
    end
  end

  def cancel_subscription!
    if active_subscription.may_cancel?
      active_subscription.use_paypal? ? cancel_paypal(:cancel!, active_subscription.subscription_sub_periods.size) : cancel_regular(:cancel!)
    elsif active_subscription.may_cancel_during_lockup?
      active_subscription.use_paypal? ? cancel_paypal(:cancel_during_lockup!, active_subscription.subscription_sub_periods.size*2) : cancel_regular(:cancel_during_lockup!)
    else
      self.errors.add(:base, I18n.t("subscriptions.cant_be_canceled"))
      false
    end
  end

  def cancel_regular(_method)
    active_subscription.send(_method)
    update_attribute(:subscriber_type, SUBSCRIBER_TYPE_AD_HOC)
  end

  def cancel_paypal(_method, totalbillingcycles)
    if profile = PaypalRecurringProfile.new(active_subscription.paypal_profile_id) and profile.update_profile(:totalbillingcycles => totalbillingcycles)
      cancel_regular(_method)
    else
      self.errors.add(:base, profile.result["L_LONGMESSAGE0"])
      false
    end
  end

  def subscription_required?
    has_any_role?(:category_supplier, :supplier, :member) and parent.nil?
  end

  def has_active_subscription?
    !active_subscription.nil?
  end

  def has_free_subscription?
    has_active_subscription? and active_subscription.is_free?
  end

  def can_downgrade_subscription?
    active_subscription.can_be_downgraded? and active_subscription.may_downgrade?
  end

  def can_upgrade_subscription?
    active_subscription.can_be_upgraded? and active_subscription.may_upgrade?
  end

  def can_upgrade_or_downgrade_subscription?
    can_upgrade_subscription? or can_downgrade_subscription?
  end

  def can_cancel_subscription?
    active_subscription.may_cancel? or active_subscription.may_cancel_during_lockup?
  end

  def can_cancel_subscription_at
    active_subscription.can_cancel_at
  end

  def is_lockup_period?
    active_subscription.lockup?
  end

  def is_penalty_period?
    active_subscription.penalty?
  end


  def is_extendable?
    active_subscription.normal? or active_subscription.lockup?
  end

  def has_free_period_available?
    vat_number.to_s.strip.present? and CompanyVat.where("lower(vat_number) like ?", vat_number.strip.downcase).first.nil?
  end

  def ad_hoc?
    subscriber_type == SUBSCRIBER_TYPE_AD_HOC
  end

  def big_buyer?
    active_subscription ? (read_attribute(:big_buyer) ? true : active_subscription.big_buyer?) : parent ? parent.big_buyer? : false
  end

  def team_buyers?
    active_subscription ? active_subscription.team_buyers? : false
  end

  def deal_maker?
    active_subscription ? active_subscription.deal_maker? : admin? ? true : has_role?(:deal_maker)
  end

  def handle_privileges
    if subaccounts.any?
      if team_buyers?
        subaccounts.each { |u| u.update_attribute(:locked, "unlock") if u.locked_at }
      else
        subaccounts.each { |u| u.update_attribute(:locked, "lock") if u.locked_at.nil? }
      end
    end
  end

  def can_create_deals?
    has_one_of_roles?(:agent, :admin, :call_centre_agent, :call_centre) or
        (supplier? and (!active_subscription.is_free? or (active_subscription.is_free? and free_deals_in_free_period.to_i > 0)))
  end

  def screen_name
    tmp_screen_name = ["#{first_name}"]
    if parent and company_name.to_s.strip.blank?
      tmp_screen_name << "#{parent.company_name.to_s.strip}"
    else
      tmp_screen_name << "#{company_name.to_s.strip}"
    end

    tmp_screen_name.select { |s| !s.blank? }.join(", ")
  end

  def set_auto_buy_enabled
    if new_record? and auto_buy_enabled.nil?
      self.auto_buy_enabled = (has_role?(:category_supplier) or is_a?(User::CategorySupplier))
    end
    true
  end

  def can_request?(deal)
    (!deal.premium_deal? and ((active_subscription.is_free? and free_deal_requests_in_free_period.to_i > 0) or !active_subscription.is_free?)) or
        (!active_subscription.is_free? and deal.premium_deal? and active_subscription.premium_deals?)
  end

  def decrement_free_deals_in_free_period!
    if active_subscription.is_free? and free_deals_in_free_period.to_i > 0
      self.free_deals_in_free_period = free_deals_in_free_period-1
      save(:validate => false)
    end
  end

  def decrement_free_deal_requests_in_free_period!
    if active_subscription.is_free? and free_deal_requests_in_free_period.to_i > 0
      self.free_deal_requests_in_free_period = free_deal_requests_in_free_period-1
      save(:validate => false)
    end
  end
  
  def queue
    "user_#{id}"
  end

  def notify!(options)
    options = {
      :notify_at => Time.now,
      :sticky => true,
      :time => nil
    }.merge(options)
    notifications.create(options)
  end
end