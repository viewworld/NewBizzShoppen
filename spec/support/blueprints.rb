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


User.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
 screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','')}
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { Country.first }
end

::User::Admin.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
 screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { Country.first }
end

::User::Customer.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
 screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { Country.first }
  roles_mask { 112 }
  team_buyers { false }
end

::User::PurchaseManager.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
 screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { Country.first }
  roles_mask { 128 }
end

::User::LeadUser.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
 screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { Country.first }
  roles_mask { 64 }
end

::User::LeadBuyer.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
 screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { Country.first }
  roles_mask { 96 }
end

::User::Agent.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name + Time.now.to_f.to_s.sub('.','') }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { Country.make! }
  roles_mask { 2 }
end

::User::CallCentre.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name + Time.now.to_f.to_s.sub('.','') }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { Country.make!.id }
  payout { rand(100) }
  roles_mask { 4 }
end

::User::CallCentreAgent.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name + Time.now.to_f.to_s.sub('.','') }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { Country.make!.id }
  roles_mask { 8 }
end

::User::CategoryBuyer.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  street { Faker::Address.street_name }
  first_name { Faker::Name.first_name + Time.now.to_f.to_s.sub('.','') }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  city { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  county { Faker::Address.uk_county }
  country { Country.make!.id }
  category_id { Category.make!.id }
  roles_mask { 304 }
end

::Article::Cms::InterfaceContentText.blueprint do
  title { Faker::Lorem.words(4).to_s.capitalize }
  content { Faker::Lorem.sentences(2).to_s }
end

::Article::Cms::MainPageArticle.blueprint do
  title { Faker::Lorem.words(4).to_s.capitalize }
  content { Faker::Lorem.sentences(2).to_s }
end

::Article::Cms::HelpPopup.blueprint do
  title { Faker::Lorem.words(4).to_s.capitalize }
  content { Faker::Lorem.sentences(2).to_s }
end

::Article::News::Agent.blueprint do
  title { Faker::Lorem.words(4).to_s.capitalize }
  content { Faker::Lorem.sentences(2).to_s }
end

::Article::News::SalesManager.blueprint do
  title { Faker::Lorem.words(4).to_s.capitalize }
  content { Faker::Lorem.sentences(2).to_s }
end

::Article::News::PurchaseManager.blueprint do
  title { Faker::Lorem.words(4).to_s.capitalize }
  content { Faker::Lorem.sentences(2).to_s }
end

::Article::News::CategoryHome.blueprint do
  title { Faker::Lorem.words(4).to_s.capitalize }
  content { Faker::Lorem.sentences(2).to_s }
  resource { Category.make! }
end

Invoice.blueprint do
  user { User::Customer.make! }
  seller { Seller.make! }
end

InvoiceLine.blueprint do
  invoice { Invoice.make! }
  name { Faker::Lorem.words(4).to_s }
  netto_price { rand(10000) }
  quantity { rand(100) }
end

BankAccount.blueprint do
  country { Country.make! }
  bank_name { Faker::Lorem.words(2).to_s }
  bank_address { "#{Faker::Address.street_name}\n#{Faker::Address.zip_code} #{Faker::Address.city}\n#{Faker::Address.city}" }
  iban_no { Faker.numerify('###################') }
  local_bank_number { Faker.numerify('#########') }
  swift { Faker.letterify('????????').upcase }
end

Seller.blueprint do
  country_id { Country.make!.id }
  name { Faker::Lorem.words(2).to_s }
  first_name { Faker::Lorem.words(1).to_s }
  last_name { Faker::Lorem.words(1).to_s }
  address { "#{Faker::Address.street_name}\n#{Faker::Address.zip_code} #{Faker::Address.city}\n#{Faker::Address.city}" }
  vat_no { Faker.numerify('#########') }
end