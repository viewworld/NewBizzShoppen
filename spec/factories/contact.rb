FactoryGirl.define do
  factory :contact do
    sequence(:company_name) { |n| "company_name#{n}" }
    company_phone_number { Faker.numerify('#######') }
    country { FactoryGirl.create(:country) }
    sequence(:contact_name) { |n| "contact_name_#{n}" }
    sequence(:email_address) { |n| "contact_#{n}@fairpeople.com" }
    creator { FactoryGirl.create(:agent) }
    category { FactoryGirl.create(:lead_category) }
    campaign { FactoryGirl.create(:campaign) }
  end
end
