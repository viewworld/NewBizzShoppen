class User::Agent < ::User
  ROLES = [:agent]

  include User::RegistrationValidations
  include User::CommonAgent
  include Addresses
  include BankAccounts

  before_create :set_default_certification_level

  def comment_threads
    Comment.roots.where(:commentable_id => leads.map(&:id))
  end

  private

  def set_default_certification_level
    self.certification_level = User::BRONZE_CERTIFICATION
  end
end