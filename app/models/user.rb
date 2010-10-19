class User < ActiveRecord::Base
  include RoleModel
  require 'unsafe_writer'
  include UnsafeWriter
  include ScopedSearch::Model


  COUNTRIES = [
          ['Poland', 0],
          ['France', 1]
  ].freeze

  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  roles :admin, :agent, :call_centre, :call_centre_agent, :customer, :lead_buyer, :lead_user

  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :subaccounts, :class_name => "User", :foreign_key => "parent_id"
  belongs_to :user, :class_name => "User", :foreign_key => "parent_id", :counter_cache => :subaccounts_counter

  scope :with_role, lambda { |role| where("roles_mask & #{2**User.valid_roles.index(role.to_sym)} > 0 ") }
  scope :with_keyword, lambda { |q| where("lower(first_name) like :keyword OR lower(last_name) like :keyword OR lower(email) like :keyword", {:keyword => "%#{q.downcase}%"}) }
  scope :with_subaccounts, lambda { |parent_id| where("parent_id = ?", parent_id) }
  scoped_order :id, :roles_mask, :first_name, :last_name, :email, :age


  attr_protected :payout, :locked

  attr_accessor :agreement_read, :locked

  before_save :handle_locking

  private

  def handle_locking
    if locked
      self.locked_at = locked == "unlock" ? nil : Time.now
    end
  end

  public

  def role
    roles.first
  end

end
