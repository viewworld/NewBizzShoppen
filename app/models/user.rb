class User < ActiveRecord::Base
  include RoleModel

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  roles :admin, :buyer, :agent, :lead_user, :priviliged_buyer, :call_enter_admin, :call_center_agent

  scope :with_role, lambda { |role| where("roles_mask & #{2**User.valid_roles.index(role.to_sym)} > 0 ") }

  attr_accessible :email, :password, :password_confirmation, :remember_me
end
