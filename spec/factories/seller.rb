FactoryGirl.define do
  factory :seller do
    sequence(:company_name) { |n| "company_name_#{n}" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address {
      country = FactoryGirl.create(:vat_rate).country
      FactoryGirl.create(:address, :country => country)
    }
    vat_no { Faker.numerify('#########') }
    bank_account { FactoryGirl.create(:bank_account) }
  end
end