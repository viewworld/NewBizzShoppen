class ::User::Buyer < ::User
  ROLE = :buyer
  include User::RegularUser
end