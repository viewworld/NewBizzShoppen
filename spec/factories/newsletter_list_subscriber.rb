FactoryGirl.define do
  factory :newsletter_list_subscriber do
    newsletter_list { FactoryGirl.create(:newsletter_list) }
    subscriber { FactoryGirl.create(:contact) }
    sequence(:company_name) { |n| "company_name#{n}" }
    company_phone_number { Faker.numerify('#######') }
    country { FactoryGirl.create(:country) }
    sequence(:contact_name) { |n| "contact_name_#{n}" }
    sequence(:email_address) { |n| "contact_#{n}@fairpeople.com" }
  end
end