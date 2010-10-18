class User < ActiveRecord::Base
  include RoleModel

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

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :phone, :screen_name,
          :street, :city, :zip_code, :county, :country, :newsletter_on, :agreement_read, :newsletter_on, :payout

  attr_accessor :agreement_read

  private
  
  public

  def role
    roles.first
  end
  
end
