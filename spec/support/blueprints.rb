require 'machinist/active_record'
require 'faker'


User.blueprint do
  email { Faker::Internet.email }
end
