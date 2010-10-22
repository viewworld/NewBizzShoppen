class ::User::Customer < ::User
  ROLES = [:customer, :lead_buyer, :lead_user]

  include User::RegistrationValidations

  has_many :lead_purchases, :foreign_key => "owner_id"

  accepts_nested_attributes_for :lead_purchases
end