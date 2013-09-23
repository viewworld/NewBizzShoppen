class User::Agent < ::User
  ROLES = [:agent]

  include User::RegistrationValidations
  include User::CommonAgent
  include Addresses
  include BankAccounts
  include User::CommonCaller

  has_many :deals, :as => :creator

  before_create :set_default_certification_level

  def comment_threads
    Comment.with_leads_created_by(self)
  end

  private

  def set_default_certification_level
    self.certification_level = User::BRONZE_CERTIFICATION
  end
end