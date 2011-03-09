class User::Agent < ::User
  ROLES = [:agent]

  include User::RegistrationValidations
  include User::CommonAgent
  include Addresses
  include BankAccounts

  before_create :set_default_certification_level

  private

  def set_default_certification_level
    self.certification_level = User::BRONZE_CERTIFICATION
  end
end