require 'machinist/active_record'
require 'faker'
require 'spec/support/overwrites/lorem'

Category.blueprint do
  name { Faker::Lorem.words(2).to_s }
  description { Faker::Lorem.sentences(2).to_s }
end

Country.blueprint do
  name { Faker::Address.uk_country + Time.now.to_f.to_s.sub('.','') }
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
  address_line_1 { Faker::Address.street_address }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  creator_id { User::Agent.make!.id }
  creator_type { "User::Agent" }
  category_id { Category.make!.id }
  sale_limit { 1 }
  purchase_decision_date { (Date.today+5) }
  published { true }
  currency { Currency.make!}
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
  address_line_1 { Faker::Address.street_address }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  creator_id { User::Agent.make!.id }
  creator_type { "User::Agent" }
  category_id { Category.make!.id }
  sale_limit { 1 }
  purchase_decision_date { (Date.today+5) }
  featured { true }
  currency { Currency.make!}
end

Currency.blueprint do
  name { Faker::Lorem.words(1) }
  symbol { ['&euro;','&pound;','$'][rand(3)]}
  active { true }
end

LeadPurchase.blueprint do
  paid { false }
  accessible_from { nil }
  lead_id { Lead.make! }
  owner_id { User::Customer.make!.id }
end

LeadRequest.blueprint do
  paid { false }
  accessible_from { nil }
  requested_by { User::LeadBuyer.make!.id }
  lead_id { Lead.make! }
end

Address.blueprint do
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { Country.first }
  street { Faker::Address.street_name }
end

User.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','')}
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  address { Address.make! }
end

::User::Admin.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
end

::User::Customer.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  roles_mask { 112 }
  team_buyers { false }
end

::User::PurchaseManager.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  roles_mask { 128 }
end

::User::LeadUser.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  roles_mask { 64 }
end

::User::LeadBuyer.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  roles_mask { 96 }
end

::User::Agent.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  first_name { Faker::Name.first_name + Time.now.to_f.to_s.sub('.','') }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  roles_mask { 2 }
end

::User::CallCentre.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  first_name { Faker::Name.first_name + Time.now.to_f.to_s.sub('.','') }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  payout { rand(100) }
  roles_mask { 4 }
end

::User::CallCentreAgent.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  first_name { Faker::Name.first_name + Time.now.to_f.to_s.sub('.','') }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  roles_mask { 8 }
end

::Article::Cms.blueprint do
  title { Faker::Lorem.words(4).to_s.capitalize }
  content { Faker::Lorem.sentences(2).to_s }
  scope { rand(3) }
end

::Article::News.blueprint do
  title { Faker::Lorem.words(4).to_s.capitalize }
  content { Faker::Lorem.sentences(2).to_s }
  scope { rand(2) }
end

Invoice.blueprint do
  user { User::Agent.make! }
end

InvoiceLine.blueprint do
  invoice { Invoice.make! }
  name { Faker::Lorem.words(4).to_s }
  netto_price { rand(10000) }
  quantity { rand(100) }
end

BankAccount.blueprint do
  bank_name { Faker::Lorem.words(2).to_s }
  iban_no { Faker.numerify('###################') }
  local_bank_number { Faker.numerify('#########') }
  swift { Faker.letterify('????????').upcase }
  address { Address.make! }
end