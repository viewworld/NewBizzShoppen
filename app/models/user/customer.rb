class ::User::Customer < ::User
  ROLE = :customer
  include User::RegularUser

end