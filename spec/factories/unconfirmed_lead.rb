FactoryGirl.define do
  factory :unconfirmed_lead do
    association :country
    association :creator, factory: :member
    association :category, factory: :lead_category
    association :deal

    header { Faker::Lorem.words(4) }
    description { Faker::Lorem.sentences(2) }
    hidden_description { Faker::Lorem.sentences(2) }

    purchase_value { Faker.numerify("###").to_f }
    price { Faker.numerify("###").to_f }

    company_name { Faker::Company.name }
    contact_name { Faker::Name.name }
    phone_number { Faker::PhoneNumber.phone_number }
    email_address { Faker::Internet.email }
    address_line_1 { Faker::Address.street_address }
    address_line_3 { Faker::Address.city }
    zip_code { Faker::AddressUS.zip_code }

    sale_limit 10
    published true
    purchase_decision_date { Date.today + 5 }
  end
end
