class User::PurchaseManager < ::User
  ROLES = [:purchase_manager]

  include User::RegistrationValidations
  include User::CommonAgent

  def can_publish_leads?
    false
  end
end