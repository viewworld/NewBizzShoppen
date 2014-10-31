FactoryGirl.define do
  factory :seller do
    bank_account
    
    address do
      country = FactoryGirl.create(:vat_rate).country
      FactoryGirl.create(:address, country: country)
    end

    sequence(:company_name) { |n| "company_name_#{n}" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    vat_no { Faker.numerify('#########') }

    note { Faker::Lorem.sentences(rand(4)) }

    factory :default_seller do
      default true
    end
  end
end
