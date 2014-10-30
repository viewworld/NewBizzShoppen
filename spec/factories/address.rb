FactoryGirl.define do
  factory :address do
    address_line_1 { Faker::AddressDA.street_name }
    address_line_2 { Faker::AddressDA.city }
    address_line_3 { Faker::AddressDA.region }
    zip_code { Faker::AddressDA.zip_code }
    country
  end

  factory :bank_address, class: Address::Bank, parent: :address do
  end
end
