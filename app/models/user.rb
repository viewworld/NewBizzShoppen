class User < ActiveRecord::Base
  self.abstract_class = true

  ROLES_PRIORITY = [:admin, :call_centre, :agent, :call_centre_agent, :customer, :lead_buyer, :lead_user]
  DEAL_VALUE_RANGE = [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000]

  include RoleModel
  include ScopedSearch::Model

  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  roles :admin, :agent, :call_centre, :call_centre_agent, :customer, :lead_buyer, :lead_user

  validates_presence_of :email, :screen_name
  validates_uniqueness_of :email, :screen_name

  has_many :subaccounts, :class_name => "User", :foreign_key => "parent_id"
  belongs_to :user, :class_name => "User", :foreign_key => "parent_id", :counter_cache => :subaccounts_counter
  alias_method :parent, :user

  scope :with_role, lambda { |role| where("roles_mask & #{2**User.valid_roles.index(role.to_sym)} > 0 ") }
  scope :with_keyword, lambda { |q| where("lower(first_name) like :keyword OR lower(last_name) like :keyword OR lower(email) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :with_subaccounts, lambda { |parent_id| where("parent_id = ?", parent_id) }

  scoped_order :id, :roles_mask, :first_name, :last_name, :email, :age


  attr_protected :payout, :locked

  attr_accessor :agreement_read, :locked

  before_save :handle_locking
  before_create :set_rss_token, :set_role

  liquid :email, :first_name, :last_name, :confirmation_instructions_url, :reset_password_instructions_url

  private

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

  def all_requested_lead_ids
    LeadRequest.where(:requested_by => (parent ? parent.subaccounts : subaccounts).with_role(:lead_user).map(&:id))
  end

  def all_purchased_lead_ids
    user = parent || self
    user.has_role?(:customer) ? LeadPurchase.where(:owner_id => user.id, :accessible => true) : []
  end

#TODO Manage to move to buyer :) ... if possible
  def cart
    @cart ||= Cart.new(User::LeadBuyer.find(self.id))
  end

  def self.inherited(subclass)
    super
    subclass.send(:default_scope, with_role(subclass.name.split('::').last.tableize.singularize))
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

end