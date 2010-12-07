require 'machinist/active_record'
require 'faker'
require 'spec/support/overwrites/lorem'

Category.blueprint do
  name { Faker::Lorem.words(2).to_s }
  description { Faker::Lorem.sentences(2).to_s }
end

Country.blueprint do
  name { Faker::Address.uk_country + rand(99999).to_s }
end

Lead.blueprint do
  header { Faker::Lorem.words(4).to_s.capitalize }
  description { Faker::Lorem.sentences(2).to_s }
  hidden_description { Faker::Lorem.sentences(2).to_s }
  purchase_value { Faker.numerify("###").to_f }
  price { Faker.numerify("###").to_f }
  country_id { 1 }
  company_name { Faker::Internet.domain_word.capitalize }
  contact_name { Faker::Name.name }
  phone_number { Faker::PhoneNumber.phone_number }
  email_address { Faker::Internet.email }
  address { Faker::Address.street_address }
  creator_id { User::Agent.make!.id }
  creator_type { "User::Agent" }
  category_id { Category.make!.id }
  sale_limit { 1 }
  purchase_decision_date { (Date.today+5) }
end

Lead.blueprint(:featured) do
  header { Faker::Lorem.words(4).to_s.capitalize }
  description { Faker::Lorem.sentences(2).to_s }
  hidden_description { Faker::Lorem.sentences(2).to_s }
  purchase_value { Faker.numerify("###").to_f }
  price { Faker.numerify("###").to_f }
  country_id { 1 }
  company_name { Faker::Internet.domain_word.capitalize }
  contact_name { Faker::Name.name }
  phone_number { Faker::PhoneNumber.phone_number }
  email_address { Faker::Internet.email }
  address { Faker::Address.street_address }
  creator_id { User::Agent.make!.id }
  creator_type { "User::Agent" }
  category_id { Category.make!.id }
  sale_limit { 1 }
  purchase_decision_date { (Date.today+5) }
  featured { true }
end

LeadPurchase.blueprint do
  paid { false }
  accessible { false }
  lead_id { Lead.make! }
  owner_id { User::Customer.make!.id }
end

LeadRequest.blueprint do
  paid { false }
  accessible { false }
  requested_by { User::LeadBuyer.make!.id }
  lead_id { Lead.make! }
end


User.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
 screen_name { Faker::Name.name + rand(9999).to_s }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { 1 }
end

::User::Admin.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
 screen_name { Faker::Name.name + rand(9999).to_s }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { 1 }
end

::User::Customer.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
 screen_name { Faker::Name.name + rand(9999).to_s }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { 1 }
  roles_mask { 112 }
end

::User::LeadUser.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
 screen_name { Faker::Name.name + rand(9999).to_s }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { 1 }
  roles_mask { 64 }
end

::User::LeadBuyer.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
 screen_name { Faker::Name.name + rand(9999).to_s }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { 1 }
  roles_mask { 96 }
end

::User::Agent.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name + "rand" }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { Country.make!.id }
  roles_mask { 2 }
end