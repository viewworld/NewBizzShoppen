require 'app/modules/role_change'

class User < ActiveRecord::Base

  self.abstract_class = true
  ajaxful_rater

  ROLES_PRIORITY = [:admin, :call_centre, :agent, :call_centre_agent, :purchase_manager, :category_buyer, :customer, :lead_buyer, :lead_user, :translator, :deal_maker]
  DEAL_VALUE_RANGE = [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000]
  BASIC_USER_ROLES_WITH_LABELS = [['Administrator', 'admin'], ['Agent', 'agent'], ['Buyer', 'customer'], ['Call centre', 'call_centre'], ['Purchase Manager', 'purchase_manager'], ['Category Buyer', 'category_buyer']]
  ADDITIONAL_USER_ROLES_WITH_LABELS = [['Lead user', "lead_user"], ['Lead buyer', "lead_buyer"], ["Call centre agent", "call_centre_agent"]]

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

  include RoleModel
  include ScopedSearch::Model
  include RoleChange

  devise :database_authenticatable, :registerable, :confirmable, :lockable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :rpx_connectable

  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  roles :admin, :agent, :call_centre, :call_centre_agent, :customer, :lead_buyer, :lead_user, :purchase_manager, :category_buyer, :translator, :deal_maker

  validates_presence_of :email, :screen_name
  validates_presence_of :first_name, :last_name, :if => :validate_first_and_last_name?
  validates_uniqueness_of :email, :screen_name
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
  has_many :email_bounces, :foreign_key => :email, :primary_key => :email

  alias_method :parent, :user

  scope :with_customers, where("roles_mask & #{2**User.valid_roles.index(:customer)} > 0 ")
  scope :with_agents, where("(roles_mask & #{2**User.valid_roles.index(:agent)} > 0) or (roles_mask & #{2**User.valid_roles.index(:call_centre_agent) } > 0) or (roles_mask & #{2**User.valid_roles.index(:purchase_manager)} > 0) or (roles_mask & #{2**User.valid_roles.index(:call_centre) } > 0)")
  scope :with_possible_deal_admins, where("(roles_mask & #{2**User.valid_roles.index(:agent)} > 0) or (roles_mask & #{2**User.valid_roles.index(:call_centre_agent) } > 0) or (roles_mask & #{2**User.valid_roles.index(:call_centre) } > 0)").order("email ASC")
  scope :with_agents_without_call_centres, where("(roles_mask & #{2**User.valid_roles.index(:agent)} > 0) or (roles_mask & #{2**User.valid_roles.index(:call_centre_agent) } > 0) or (roles_mask & #{2**User.valid_roles.index(:purchase_manager)} > 0)")
  scope :with_call_centre_agents, lambda { |call_centre| where("(roles_mask & #{2**User.valid_roles.index(:call_centre_agent)} > 0) and parent_id = ?", call_centre.id) }
  scope :with_role, lambda { |role| where("roles_mask & #{2**User.valid_roles.index(role.to_sym)} > 0 ") }
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
  scope :within_accessible_categories, lambda { |customer| where("leads.category_id NOT IN (?)", customer.accessible_categories_ids) }
  scope :right_join_leads, joins("RIGHT JOIN leads on users.id=leads.creator_id")
  scope :screen_name_and_id_with_leads, right_join_leads.select("DISTINCT(users.screen_name),users.id")
  scope :with_leads_within_categories, lambda { |category_ids| right_join_leads.where("leads.category_id IN (?)", category_ids.to_a) }

  scope :assigned_to_campaigns, select("DISTINCT(users.id), users.*").joins("inner join campaigns_users on users.id=campaigns_users.user_id")
  scope :with_results, joins("inner join call_results on users.id=call_results.creator_id")
  scope :for_campaigns, lambda { |campaign_ids| where("campaigns_users.campaign_id in (?)", campaign_ids) unless campaign_ids.empty? }

  scoped_order :id, :roles_mask, :first_name, :last_name, :email, :age, :department, :mobile_phone, :completed_leads_counter, :leads_requested_counter,
               :leads_assigned_month_ago_counter, :leads_assigned_year_ago_counter, :total_leads_assigned_counter, :leads_created_counter,
               :leads_volume_sold_counter, :leads_revenue_counter, :leads_purchased_month_ago_counter, :leads_purchased_year_ago_counter,
               :leads_rated_good_counter, :leads_rated_bad_counter, :leads_not_rated_counter, :leads_rating_avg, :certification, :payout,
               :revenue_counter, :leads_purchased_counter, :leads_volume_sold_counter, :leads_revenue_counter, :unpaid_leads_counter, :company_name

  attr_protected :payout, :locked, :can_edit_payout_information, :paypal_email, :bank_swift_number, :bank_iban_number, :skip_email_verification

  attr_accessor :agreement_read, :locked, :skip_email_verification, :deal_maker_role_enabled_flag

  before_save :handle_locking, :handle_team_buyers_flag, :refresh_certification_of_call_centre_agents, :set_euro_billing_rate, :handle_deal_maker_enabled
  before_create :set_rss_token, :set_role
  before_destroy :can_be_removed
  after_create :auto_activate
  validate :check_billing_rate

  liquid :email, :confirmation_instructions_url, :reset_password_instructions_url, :social_provider_name, :category_buyer_category_home_url,
         :screen_name, :first_name, :last_name
  require 'digest/sha1'

  private

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
    [:leads, :lead_purchases, :lead_requests, :leads_in_cart].detect do |method|
      casted_obj.respond_to?(method) and !casted_obj.send(method).empty?
    end.nil?
  end

  def handle_locking
    if locked
      self.locked_at = locked == "unlock" ? nil : Time.now
    end
  end

  def handle_team_buyers_flag
    if team_buyers_changed? and !team_buyers # unchecking / turning off
      if owned_lead_requests.any?
        errors.add(:team_buyers, I18n.t("errors.messages.user.team_buyers.has_lead_requests"))
        return false
      elsif subaccounts.any?
        errors.add(:team_buyers, I18n.t("errors.messages.user.team_buyers.has_subaccounts"))
        return false
      end
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
    self.roles = [self.class.const_get("ROLES")]
  end

  def casted_class
    "User::#{role.to_s.camelize}".constantize
  end

  def mailer_host
    Nbs::Application.config.action_mailer.default_url_options[:host]
  end

  def deliver_email_template(uniq_id)
    TemplateMailer.delay.new(email, uniq_id.to_sym, with_role.address.present? ? with_role.address.country : Country.get_country_from_locale, {:user => self.with_role})
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

  public

  def all_requested_lead_requests
    LeadRequest.where(:requested_by => (parent ? parent.subaccounts : subaccounts).with_role(:lead_user).map(&:id))
  end

  def all_purchased_lead_purchases
    user = parent || self
    user.has_role?(:customer) ? LeadPurchase.where("owner_id = ? and accessible_from IS NOT NULL", user.id) : []
  end

  def all_requested_lead_ids
    all_requested_lead_requests.map(&:lead_id)
  end

  def all_purchased_lead_ids
    all_purchased_lead_purchases.map(&:lead_id)
  end

#TODO Manage to move to buyer :) ... if possible
  def cart
    @cart ||= Cart.new(User::LeadBuyer.find(self.id))
  end

  def self.inherited(subclass)
    super
    subclass.send(:default_scope, with_role(subclass.name.split('::').last.tableize.singularize)) unless subclass.name.split('::').last.tableize.singularize == "abstract"
  end

  # TODO find out which roles are invoiceable
  def self.invoiceable
    all.reject { |u| !defined? u.with_role.address }
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
    "https://#{mailer_host}/users/confirmation?confirmation_token=#{confirmation_token}"
  end

  def reset_password_instructions_url
    "https://#{mailer_host}/users/password/edit?reset_password_token=#{reset_password_token}"
  end

  def roles_as_text
    selected_role = (BASIC_USER_ROLES_WITH_LABELS + ADDITIONAL_USER_ROLES_WITH_LABELS).detect { |r| r.last == role.to_s }
    selected_role.blank? ? "" : selected_role.first
  end

  def self.role_as_text(_role)
    selected_role = BASIC_USER_ROLES_WITH_LABELS.detect { |r| r.last == _role.to_s }
    selected_role.blank? ? "" : selected_role.first
  end

  def refresh_buyer_counters!
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
    parent.present? and has_any_role?(:lead_buyer, :lead_user) and User::Customer.find(parent_id).category_interests.present?
  end

  def can_save_category_interests?
    has_any_role?(:customer)
  end

  def accessible_categories_ids
    User::Customer.find(parent_id.blank? ? id : parent_id).category_interests.map(&:category_id)
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
    has_any_role?(:admin, :call_centre, :agent, :call_centre_agent, :customer)
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
    if has_role?(:lead_buyer)
      [:lead_buyer] + roles.select { |r| r != :lead_buyer }
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

  def buyer?
    has_any_role?([:customer, :category_buyer, :lead_buyer])
  end

  def admin?
    has_role?(:admin)
  end

  def purchase_manager?
    has_role?(:purchase_manager)
  end

  def purchase_limit_reached?(lead, buyout=false)
    return false unless big_buyer?
    not_invoiced_cost = LeadPurchase.with_not_invoiced.where("owner_id = ?", id).map { |lp| lp.not_invoiced_euro_sum.to_f }.sum
    (not_invoiced_cost + (buyout ? lead.buyout_quantity : 1) * lead.currency.to_euro(lead.price)) >= (big_buyer_purchase_limit.to_f > 0 ? big_buyer_purchase_limit.to_f : Settings.big_buyer_purchase_limit.to_f)
  end

  def generate_login_key
    self.login_key = Digest::SHA1.hexdigest("#{created_at} -- #{id} -- #{Time.now}")
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
      "not linked"
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
      subscribed_categories = has_role?(:customer) ? with_role.categories : has_any_role?(:lead_buyer, :lead_user) and parent.present? ? parent.with_role.categories : []
      unless subscribed_categories.empty?
        uniq_id = "lead_notification_#{lead_notification_type == LEAD_NOTIFICATION_ONCE_PER_DAY ? 'daily' : 'weekly'}"
        leads = Lead.for_notification(subscribed_categories, lead_notification_type)
        TemplateMailer.delay.new(email, uniq_id.to_sym, user.with_role.address.country, {:user => self, :leads => leads})
      end
    end
  end

  def category_buyer_category_home_url
    if has_role?(:category_buyer)
      "https://#{mailer_host}/#{with_role.buying_categories.first.cached_slug}"
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
end