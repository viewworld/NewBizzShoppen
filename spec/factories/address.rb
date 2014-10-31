FactoryGirl.define do
  factory :address do
    address_line_1 { Faker::Address.street_name }
    address_line_2 { Faker::Address.street_address }
    address_line_3 { Faker::Address.city }
    zip_code { Faker::AddressUS.zip_code }
    association :country
  end

  factory :bank_address, class: Address::Bank, parent: :address do
  end
end
