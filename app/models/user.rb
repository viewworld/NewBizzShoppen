class User < ActiveRecord::Base
  include RoleModel
  require 'unsafe_writer'
  include UnsafeWriter

  COUNTRIES = [
          ['Poland', 0],
          ['France', 1]
  ].freeze

  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  roles :admin, :buyer, :agent, :lead_user, :priviliged_buyer, :call_centre, :call_centre_agent

  validates_presence_of :email
  validates_uniqueness_of :email

  scope :with_role, lambda { |role| where("roles_mask & #{2**User.valid_roles.index(role.to_sym)} > 0 ") }

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
