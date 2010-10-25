require 'machinist/active_record'
require 'faker'

Category.blueprint do
  name { Faker::Lorem.words(2).to_s }
  description { Faker::Lorem.sentences(2).to_s }
end

Lead.blueprint do
  header { Faker::Lorem.words(4).to_s.capitalize }
  description {  Faker::Lorem.sentences(2).to_s }
  hidden_description { Faker::Lorem.sentences(2).to_s }
  purchase_value { Faker.numerify("###").to_f }
  price { Faker.numerify("###").to_f }
  country_id { 0 }
  company_name { Faker::Internet.domain_word.capitalize }
  lead_name { Faker::Name.name }
  phone_number { Faker::PhoneNumber.phone_number }
  email_address { Faker::Internet.email }
  address { Faker::Address.street_address }
  creator_id { ::User::Agent.make!.id }
  creator_type { "User::Agent" }
end

LeadPurchase.blueprint do
  paid { false }
  accessible { false }
end


User.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country {  0 }
end

::User::LeadBuyer.blueprint do
   email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country {  0 }
  roles_mask { 96 }
end

::User::Agent.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country {  0 }
  roles_mask { 2 }
end