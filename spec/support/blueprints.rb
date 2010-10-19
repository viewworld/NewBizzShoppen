require 'machinist/active_record'
require 'faker'


User.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
end
