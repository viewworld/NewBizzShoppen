require 'machinist/active_record'
require 'faker'
require 'spec/support/overwrites/lorem'

LeadCategory.blueprint do
  name { Faker::Lorem.words(2).to_s + Time.now.to_f.to_s.sub('.','') }
  description { Faker::Lorem.sentences(2).to_s }
  default_price { 0.0 }
  currency { Currency.make! }
end

DealCategory.blueprint do
  name { Faker::Lorem.words(2).to_s + Time.now.to_f.to_s.sub('.','') }
  description { Faker::Lorem.sentences(2).to_s }
end

Country.blueprint do
  name { Faker::Address.uk_country + Time.now.to_f.to_s.sub('.','') }
  locale { "en" }
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
  use_company_name_as_category { true }
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

UnconfirmedLead.blueprint do
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
  category_id { LeadCategory.make!.id }
  creator { User::Member.make! }
  deal { Deal.make! }
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
  owner_id { User::Supplier.make!.id }
end

LeadSinglePurchase.blueprint do
  paid { false }
  accessible_from { nil }
  lead_id { Lead.make! }
  owner_id { User::Supplier.make!.id }
end

LeadRequest.blueprint do
  paid { false }
  accessible_from { nil }
  requested_by { User::LeadSupplier.make!.id }
  lead_id { Lead.make! }
end

Address.blueprint do
  address_line_1 { Faker::Address.street_name }
  address_line_2 { Faker::Address.city }
  address_line_3 { Faker::Address.uk_county }
  zip_code { Faker::Address.zip_code }
  country { Country.first.nil? ? Country.make!(:name => "Denmark", :locale => "da") : Country.first}
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
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
end

::User::Admin.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  address { Address.make! }
  company_name { Faker::Company.name }
end

::User::Supplier.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  roles_mask { 48 }
  company_name { Faker::Company.name }
  address { Address.make! }
  assign_free_subscription_plan { true }
end

::User::Member.blueprint do
  company_name { Faker::Company.name }
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  roles_mask { 128 }
  address { Address.make! }
  assign_free_subscription_plan { true }
end

::User::LeadUser.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  roles_mask { 64 }
  parent_id { User::Supplier.make!.id }
end

::User::LeadSupplier.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  roles_mask { 96 }
  parent_id { User::Supplier.make!.id }
end

::User::Agent.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
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
  first_name { Faker::Name.first_name + Time.now.to_f.to_s.sub('.','') }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  roles_mask { 8 }
  address { Address.make! }
  currency { Currency.make! }
  billing_rate { 10 }
end

::User::CategorySupplier.blueprint do
  email { Faker::Internet.email }
  password { "secret" }
  password_confirmation { "secret" }
  phone { Faker::PhoneNumber.phone_number }
  first_name { Faker::Name.first_name + Time.now.to_f.to_s.sub('.','') }
  last_name { Faker::Name.last_name }
  agreement_read { true }
  buying_categories { Array(LeadCategory.make!) }
  roles_mask { 304 }
  company_name { Faker::Company.name }
  address { Address.make! }
  assign_free_subscription_plan { true }
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

::Article::News::Supplier.blueprint do
  title { Faker::Lorem.words(4).to_s.capitalize }
  content { Faker::Lorem.sentences(2).to_s }
end

::Article::News::Member.blueprint do
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
  user { User::Supplier.make! }
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

Contact.blueprint(:empty) do
  header { "" }
  description { "" }
  hidden_description { "" }
  purchase_value { 0 }
  price { 0.0 }
  contact_name { "" }
  phone_number { "" }
  email_address { "" }
  address_line_1 { "" }
  address_line_3 { "" }
  zip_code { "" }
  sale_limit { nil }
  purchase_decision_date { (Date.today+5) }
  published { true }
  currency { Currency.make!}
  company_name { Faker::Internet.domain_word.capitalize }
  company_phone_number {  Faker.numerify("#######") }
  creator_id { User::Agent.make!.id }
  creator_type { "User::Agent" }
  creator_name { Faker::Name.name }
  category_id { LeadCategory.make!.id }
  country_id { 1 }
  campaign { Campaign.make! }
end

Result.blueprint do
  name { Faker::Lorem.words(3).to_s.capitalize }
  final { false }
end

Result.blueprint(:final) do
  final { true }
end

Result.blueprint(:upgrades_to_lead) do
  name { "Upgraded to lead" }
  final { true }
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

CallResult.blueprint(:upgraded_to_member) do
  contact { Contact.make! }
  result { Result.where("name = ? and generic IS TRUE", "Upgrade to member").first || Result.make!(:final_reported, :name => "Upgrade to member", :is_generic => true) }
  note { Faker::Lorem.words(5).to_s.capitalize }
  creator { ::User::CallCentreAgent.make! }
  contact_company_name { Faker::Lorem.words(2).to_s.capitalize }
  contact_first_name { Faker::Name.first_name }
  contact_last_name { Faker::Name.last_name }
  contact_phone_number { Faker::PhoneNumber.phone_number }
  contact_address_line_1 { Faker::Lorem.words(2).to_s.capitalize }
  contact_address_line_2 { Faker::Lorem.words(2).to_s.capitalize }
  contact_address_line_3 { Faker::Lorem.words(1).to_s.capitalize }
  contact_zip_code { Faker::Address.zip_code }
  contact_country_id { 1 }
  contact_subscription_plan_id { SubscriptionPlan.active.free.for_role(:member).first }
  contact_requested_deal_ids { [Deal.make!(:price => 18), Deal.make!(:price => 24)].map(&:id) }
  contact_email_address { Faker::Internet.email }
  result_values { [ResultValue.new(:result_field => Result.where("name = ? and generic IS TRUE", "Upgrade to member").first.result_fields.first, :field_type => ResultField::MATERIAL, :value => "")] }
end

CallResult.blueprint(:call_back) do
  contact { Contact.make! }
  result { Result.where("name = ? and generic IS TRUE", "Call back").first || Result.make!(:not_final_reported, :name => "Call back", :is_generic => true) }
  note { Faker::Lorem.words(5).to_s.capitalize }
  creator { ::User::CallCentreAgent.make! }
  result_values { [ResultValue.new(:result_field => Result.where("name = ? and generic IS TRUE", "Call back").first.result_fields.first, :field_type => ResultField::DATETIME, :value => Time.zone.now.strftime("%Y-%m-%d %H:%M"))] }
end

UserSessionLog.blueprint do
  user { ::User::CallCentreAgent.make! }
  start_time { Time.now }
  end_time { Time.now + 5.minutes }
  euro_billing_rate { 10 }
  log_type { UserSessionLog::TYPE_CAMPAIGN }
  campaign { Campaign.make! }
end

EmailBounce.blueprint do
  subject { Faker::Lorem.words(3).to_s }
  name { "Hard bounce" }
  inactive { true }
  content { Faker::Lorem.words(10).to_s }
  tag { Faker::Lorem.words(1).to_s }
  message_id { Faker.numerify("#########") }
  details { Faker::Lorem.words(3).to_s }
  postmark_id { Faker.numerify("###") }
  can_activate { true }
  bounced_at { Time.now }
  description { Faker::Lorem.words(3).to_s }
  email { User::Agent.make!.email }
  type_code { "HardBounce" }
  dump_available { true }
end

SubscriptionPlan.blueprint do
  name { Faker::Lorem.words(3).to_s }
  assigned_roles { "supplier" }
  subscription_period { 8 }
  lockup_period { 2 }
  billing_period { 0 }
  free_period { 0 }
  currency_id { Currency.make! }
  is_active { true }
  can_be_upgraded { true }
  can_be_downgraded { true }
  team_buyers { false }
  big_buyer { false }
  deal_maker { false }
  newsletter_manager { false }
  seller { Seller.make! }
  paypal_retries { 1 }
end

SubscriptionPlanLine.blueprint do
  name { Faker::Lorem.words(3).to_s }
  price { rand(40).to_f+1 }
end

ArchivedEmail.blueprint do
  subject { Faker::Lorem.words(4).to_s }
  body { Faker::Lorem.words(10).to_s }
  to { Faker::Internet.email }
  status { 1 }
end

ArchivedEmail.blueprint(:bounced) do
  bounced_at { Time.now }
  status { 2 }
end

LeadTemplate.blueprint do
  name { Faker::Lorem.words(2).to_s.capitalize }
  category { LeadCategory.make! }
  is_active { true }
  creator { User::Agent.make! }
end

Region.blueprint do
  name { Faker::Lorem.words(2).to_s.capitalize }
  country { Country.make! }
end

ChainMailItem.blueprint do
  subject { Faker::Lorem.words(3).to_s.capitalize }
  body { Faker::Lorem.words(5).to_s.capitalize }
end

ChainMailType.blueprint do
  name { Faker::Lorem.words(2).to_s.capitalize }
  first_execution_delay { 1 }
  cycle_time { 1 }
  execution_time { "10:00" }
  execution_conditions { {"conditions" => [ChainMailType::LINK_CLICKED], "type" => ChainMailType::STOP_IF, "operator" => nil } }
  campaign_id { Campaign.make!.id }
  result_id { Result.make!.id }
  chain_mail_items { Array(ChainMailItem.make!) }
end

ChainMail.blueprint do
  chain_mailable { CallResult.make! }
  chain_mail_type { ChainMailType.make!}
  email { Faker::Internet.email }
end

NewsletterList.blueprint do
  name { Faker::Lorem.words(2).to_s.capitalize }
  owner { User::CallCentre.make! }
  creator { User::Admin.make! }
end

NewsletterSource.blueprint(:campaign) do
  source_type { NewsletterSource::CAMPAIGN_SOURCE }
  newsletter_list { NewsletterList.make! }
  sourceable { Campaign.make! }
end

NewsletterCampaign.blueprint do
  owner { User::CallCentre.make! }
  creator { User::Admin.make! }
  cm_username { "fairletters" }
  cm_password { "secret" }
  subject { Faker::Lorem.words(5).to_s.capitalize }
  body { Faker::Lorem.sentences(2).to_s }
end

ActsAsTaggableOn::Tag.blueprint do
  name { Faker::Lorem.words(1).to_s + "#{Time.now.to_f.to_s.gsub('.','')}" }
end

Survey.blueprint do
  name { Faker::Lorem.words(2).to_s.capitalize }
  creator { User::Admin.make! }
end

SurveyQuestion.blueprint do
  title { Faker::Lorem.words(2).to_s.capitalize }
  question_type { 0 }
  is_required { false }
end