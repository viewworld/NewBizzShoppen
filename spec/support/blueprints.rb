require 'machinist/active_record'
require 'faker'
require 'spec/support/overwrites/lorem'

LeadCategory.blueprint do
  name { Faker::Lorem.words(2).to_s + Time.now.to_f.to_s.sub('.','') }
  description { Faker::Lorem.sentences(2).to_s }
end

DealCategory.blueprint do
  name { Faker::Lorem.words(2).to_s + Time.now.to_f.to_s.sub('.','') }
  description { Faker::Lorem.sentences(2).to_s }
end

Country.blueprint do
  name { Faker::Address.uk_country + Time.now.to_f.to_s.sub('.','') }
end

VatRate.blueprint do
  country { Country.make! }
  rate { Faker.numerify("##").to_f }
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
  address_line_3 { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  creator_id { User::Agent.make!.id }
  creator_type { "User::Agent" }
  category_id { LeadCategory.make!.id }
  sale_limit { 10 }
  purchase_decision_date { (Date.today+5) }
  published { true }
  currency { Currency.make!}
end

Deal.blueprint do
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
  address_line_3 { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  creator_id { User::Agent.make!.id }
  creator_type { "User::Agent" }
  category_id { DealCategory.make!.id }
  sale_limit { 10 }
  purchase_decision_date { (Date.today+5) }
  published { true }
  currency { Currency.make!}
  start_date { Date.today-5 }
  end_date { Date.today+5 }
  company_description { Faker::Lorem.sentences(2).to_s }
  published { true }
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
  address_line_3 { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  creator_id { User::Agent.make!.id }
  creator_type { "User::Agent" }
  category_id { LeadCategory.make!.id }
  sale_limit { 10 }
  purchase_decision_date { (Date.today+5) }
  featured { true }
  currency { Currency.make!}
end

Currency.blueprint do
  name { Faker::Lorem.words(1).to_s + Time.now.to_f.to_s.sub('.','') }
  symbol { ['&euro;','&pound;','$'][rand(3)]}
  active { true }
  exchange_rate { 1 }
end

LeadPurchase.blueprint do
  paid { false }
  accessible_from { nil }
  lead_id { Lead.make! }
  owner_id { User::Customer.make!.id }
end

LeadSinglePurchase.blueprint do
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
  address_line_1 { Faker::Address.street_name }
  address_line_2 { Faker::Address.city }
  address_line_3 { Faker::Address.uk_county }
  zip_code { Faker::Address.zip_code }
  country { Country.first.nil? ? Country.make!(:name => "Denmark") : Country.first}
end

Address::Bank.blueprint do
  address_line_1 { Faker::Address.street_name }
  address_line_2 { Faker::Address.city }
  address_line_3 { Faker::Address.uk_county }
  zip_code { Faker::Address.zip_code }
  country { Country.first }
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
  address { Address.make! }
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
  company_name { Faker::Company.name }
  address { Address.make! }
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
  address { Address.make! }
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
  address { Address.make! }
end

::User::CallCentre.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  company_name { Faker::Internet.domain_word.capitalize }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  agreement_read { true }
  payout { rand(100) }
  roles_mask { 4 }
  address { Address.make! }
  bank_address { Address::Bank.make! }
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
  address { Address.make! }
  currency { Currency.make! }
  billing_rate { 10 }
end

::User::CategoryBuyer.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  screen_name { Faker::Name.name + Time.now.to_f.to_s.sub('.','') }
  first_name { Faker::Name.first_name + Time.now.to_f.to_s.sub('.','') }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  buying_categories { Array(LeadCategory.make!) }
  roles_mask { 304 }
  company_name { Faker::Company.name }
  address { Address.make! }
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
  resource { LeadCategory.make! }
end

::Article::Cms::Hint.blueprint do
  title { Faker::Lorem.words(4).to_s.capitalize }
  content { Faker::Lorem.sentences(2).to_s }
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
  bank_name { Faker::Company.name }
  iban_no { Faker.numerify('###################') }
  local_bank_number { Faker.numerify('#########') }
  swift { Faker.letterify('????????').upcase }
  address { Address.make! }
end

Seller.blueprint do
  company_name { Faker::Company.name}
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  address { Address.make! }
  vat_no { Faker.numerify('#########') }
  bank_account { BankAccount.make! }
end

Comment.blueprint do
  title { Faker::Lorem.words(5).to_s.capitalize }
  body { Faker::Lorem.sentences(2).to_s }
end

Contact.blueprint do
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
  address_line_3 { Faker::Address.city }
  zip_code { Faker::Address.zip_code }
  creator_id { User::Agent.make!.id }
  creator_type { "User::Agent" }
  category_id { LeadCategory.make!.id }
  sale_limit { 10 }
  purchase_decision_date { (Date.today+5) }
  published { true }
  currency { Currency.make!}
  creator_name { Faker::Name.name }
  campaign { Campaign.make! }
  company_phone_number {  Faker.numerify("#######") }
end

Result.blueprint do
  name { Faker::Lorem.words(3).to_s.capitalize }
  final { false }
  is_reported { false }
  is_success { false }
end

Result.blueprint(:final_reported_success) do
  final { true }
  is_reported { true }
  is_success { true }
end

Result.blueprint(:final_reported) do
  final { true }
  is_reported { true }
end

Result.blueprint(:final) do
  final { true }
end

Result.blueprint(:upgrades_to_lead) do
  name { "Upgraded to lead" }
  final { true }
  is_reported { true }
  is_success { true }
  upgrades_to_lead { true }
  generic { true }
end

Campaign.blueprint do
  start_date { Date.today }
  end_date { Date.today + 7.days }
  category { LeadCategory.make! }
  cost_type { Campaign::NO_COST }
  max_contact_number { 5 }
  country { Country.make! }
  name { Faker::Lorem.words(4).to_s.capitalize }
  creator { ::User::CallCentre.make! }
  currency { Currency.make! }
end

CallResult.blueprint do
  contact { Contact.make! }
  result { Result.make! }
  note { Faker::Lorem.words(5).to_s.capitalize }
  creator { ::User::CallCentreAgent.make! }
end

UserSessionLog.blueprint do
  user { ::User::CallCentreAgent.make! }
  start_time { Time.now }
  end_time { Time.now + 5.minutes }
  euro_billing_rate { 10 }
  log_type { UserSessionLog::TYPE_CAMPAIGN }
  campaign { Campaign.make! }
end
