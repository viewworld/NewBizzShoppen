class User::PurchaseManager < ::User
  ROLES = [:purchase_manager]

  include User::RegistrationValidations
  include User::CommonAgent

end