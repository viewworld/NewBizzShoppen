FactoryGirl.define do
  factory :lead do
    association :country
    association :currency
    association :creator, factory: :agent
    association :category, factory: :lead_category

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

    trait :featured do
      featured true
    end

    factory :featured_lead, traits: [:featured]
  end

  factory :lead_purchase do
    association :lead
    association :owner, factory: :supplier

    accessible_from nil
    paid false
  end

  factory :lead_request, class: LeadRequest, parent: :lead_purchase do
  end
end
