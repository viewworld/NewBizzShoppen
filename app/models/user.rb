class User < ActiveRecord::Base
  self.abstract_class = true

  ROLES_PRIORITY = [:admin, :call_centre, :agent, :call_centre_agent, :purchase_manager, :customer, :lead_buyer, :lead_user]
  DEAL_VALUE_RANGE = [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000]
  BASIC_USER_ROLES_WITH_LABELS = [['Administrator', 'admin'], ['Agent', 'agent'], ['Buyer', 'customer'], ['Call centre', 'call_centre'], ['Purchase Manager', 'purchase_manager']]
  ADDITIONAL_USER_ROLES_WITH_LABELS = [['Lead user', "lead_user"], ['Lead buyer', "lead_buyer"], ["Call centre agent", "call_centre_agent"]]

  NOT_CERTIFIED               = 0
  SILVER_CERTIFICATION        = 1
  GOLD_CERTIFICATION          = 2
  NOT_CERTIFIED_LOCKED        = 10
  SILVER_CERTIFICATION_LOCKED = 11
  GOLD_CERTIFICATION_LOCKED   = 12
  CERTIFICATION_LEVELS = [NOT_CERTIFIED, SILVER_CERTIFICATION, GOLD_CERTIFICATION, NOT_CERTIFIED_LOCKED, SILVER_CERTIFICATION_LOCKED, GOLD_CERTIFICATION_LOCKED]

  include RoleModel
  include ScopedSearch::Model

  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  roles :admin, :agent, :call_centre, :call_centre_agent, :customer, :lead_buyer, :lead_user, :purchase_manager

  validates_presence_of :email, :screen_name
  validates_uniqueness_of :email, :screen_name

  has_many :subaccounts, :class_name => "User", :foreign_key => "parent_id"
  belongs_to :user, :class_name => "User", :foreign_key => "parent_id", :counter_cache => :subaccounts_counter
#  belongs_to :country, :foreign_key => "country"
  has_many :invoices
  alias_method :parent, :user

  scope :with_role, lambda { |role| where("roles_mask & #{2**User.valid_roles.index(role.to_sym)} > 0 ") }
  scope :with_keyword, lambda { |q| where("lower(first_name) like :keyword OR lower(last_name) like :keyword OR lower(email) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :with_subaccounts, lambda { |parent_id| where("parent_id = ?", parent_id) }

  scope :requestees_for_lead_request_owner, lambda { |owner| select("DISTINCT(users.id), users.*").where("requested_by IS NOT NULL and lead_purchases.owner_id = ? and users.parent_id = ?", owner.id, owner.id).joins("RIGHT JOIN lead_purchases on lead_purchases.requested_by=users.id") }
  scope :assignees_for_lead_purchase_owner, lambda { |owner| select("DISTINCT(users.id), users.*").where("requested_by IS NULL and lead_purchases.owner_id = ? and accessible_from IS NOT NULL and users.parent_id = ?", owner.id, owner.id).joins("RIGHT JOIN lead_purchases on lead_purchases.assignee_id=users.id") }


  scope :join_lead_purchases_and_leads, joins("INNER JOIN lead_purchases ON lead_purchases.assignee_id=users.id").joins("INNER JOIN leads on leads.id=lead_purchases.lead_id")
  scope :with_completed_leads, lambda { |assignee| select("leads.id").where("assignee_id = ? and state = ?", assignee.id, 3).join_lead_purchases_and_leads }
  scope :with_requested_leads, lambda { |requestee| select("leads.id").where("assignee_id IS NULL and requested_by = ?", requestee.id).joins("INNER JOIN lead_purchases ON lead_purchases.requested_by=users.id").joins("INNER JOIN leads on leads.id=lead_purchases.lead_id") }
  scope :with_assigned_leads_time_ago, lambda { |assignee, time| select("leads.id").where("assignee_id = ? and lead_purchases.assigned_at >= ?", assignee.id, time).join_lead_purchases_and_leads }
  scope :with_assigned_leads_total, lambda { |assignee| select("leads.id").where("assignee_id = ?", assignee.id).join_lead_purchases_and_leads }


  scoped_order :id, :roles_mask, :first_name, :last_name, :email, :age, :department, :mobile_phone, :completed_leads_counter, :leads_requested_counter,
               :leads_assigned_month_ago_count, :leads_assigned_year_ago_counter, :total_leads_assigned_counter, :leads_created_counter,
               :leads_volume_sold_counter, :leads_revenue_counter, :leads_purchased_month_ago_counter, :leads_purchased_year_ago_counter,
               :leads_rated_good_counter, :leads_rated_bad_counter, :leads_not_rated_counter, :leads_rating_avg, :certification


  attr_protected :payout, :locked, :can_edit_payout_information, :paypal_email, :bank_swift_number, :bank_iban_number

  attr_accessor :agreement_read, :locked

  before_save :handle_locking
  before_create :set_rss_token, :set_role
  before_destroy :can_be_removed

  liquid :email, :first_name, :last_name, :confirmation_instructions_url, :reset_password_instructions_url

  private

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

  def set_rss_token
    self.rss_token = generate_token
  end

  def generate_token(size=40)
    charset = (0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a
    (0...charset.size).map { charset[rand(charset.size)] }.join+id.to_s
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
    ApplicationMailer.email_template(email, EmailTemplate.find_by_uniq_id(uniq_id), {:user => self}).deliver
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

  def role
    roles.sort_by { |r| User::ROLES_PRIORITY.index(r) }.first
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def send_confirmation_instructions
    generate_confirmation_token if self.confirmation_token.nil?
    deliver_email_template("confirmation_instructions")
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

  def refresh_subaccounts_counters!
    self.completed_leads_counter = User.with_completed_leads(self).size
    self.leads_requested_counter = User.with_requested_leads(self).size
    self.leads_assigned_month_ago_counter = User.with_assigned_leads_time_ago(self, 30.days.ago).size
    self.leads_assigned_year_ago_counter = User.with_assigned_leads_time_ago(self, 12.months.ago).size
    self.total_leads_assigned_counter  = User.with_assigned_leads_total(self).size
    self.save
  end

  def refresh_agent_counters!
    self.leads_created_counter = Lead.with_created_by(self).size
    self.leads_volume_sold_counter = LeadPurchase.with_volume_sold_by(self).size
    self.leads_revenue_counter = Lead.with_revenue_by(self).first.id || 0
    self.leads_purchased_month_ago_counter = LeadPurchase.with_purchased_time_ago_by(self, 30.days.ago).size
    self.leads_purchased_year_ago_counter = LeadPurchase.with_purchased_time_ago_by(self, 12.months.ago).size
    self.leads_rated_good_counter = Lead.with_rated_good_by(self).size
    self.leads_rated_bad_counter = Lead.with_rated_bad_by(self).size
    self.leads_not_rated_counter = Lead.with_not_rated_by(self).size
    self.leads_rating_avg = LeadPurchase.with_rating_avg_by(self).first.id || 0
    self.refresh_certification_level
    self.save
  end

  def self.refresh_agents_certification_level
    (User::Agent.all + User::CallCentreAgent.all).each do |user|
      user.refresh_certification_level
      user.save
    end
  end

  def certification_level
    read_attribute(:certification_level) % 10
  end

  def refresh_certification_level
    self.certification_level = calculate_certification_level if read_attribute(:certification_level).to_i < NOT_CERTIFIED_LOCKED
  end

  def certification_level_ratio
    Lead.joins(:lead_purchases).where(:creator_id => id, :creator_type => self.class.to_s).count
  end

  def calculate_certification_level
    if certification_level_ratio >= Settings.certification_level_2.to_i
      GOLD_CERTIFICATION
    elsif certification_level_ratio >= Settings.certification_level_1.to_i
      SILVER_CERTIFICATION
    else
      NOT_CERTIFIED
    end
  end

  def has_accessible_categories?
    parent.present? and User::Customer.find(parent_id).category_interests.present?
  end

  def accessible_categories_ids
    User::Customer.find(parent_id).category_interests.map(&:category_id)
  end
  
  def address
    %{#{street}\n#{zip_code} #{city}\n#{county}}
  end

  def has_role?(r)
    roles.include?(r)
  end

  def to_s
    full_name
  end

end