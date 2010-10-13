class User < ActiveRecord::Base
  include RoleModel

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  roles :admin, :buyer, :agent, :lead_user, :priviliged_buyer, :call_enter_admin, :call_center_agent

  scope :with_role, lambda { |role| where("roles_mask & #{2**User.valid_roles.index(role.to_sym)} > 0 ") }

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :phone, :screen_name,
          :street, :city, :zip_code, :county, :country, :newsletter_on, :agreement_read, :newsletter_on

  attr_accessor :agreement_read

  validates_presence_of :first_name, :last_name, :phone, :screen_name, :street, :city, :zip_code, :county, :country, :email
  validate :validate_if_agreement_read, :on => :create

  COUNTRIES = [
    ['Poland', 0],
    ['France', 1]
  ].freeze


  def validate_if_agreement_read
    if agreement_read.to_i == 0
      self.errors.add(:agreement_read, "You have to accept the agreement")
    end
  end
end
