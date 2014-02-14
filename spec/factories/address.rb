FactoryGirl.define do
  factory :address do
    address_line_1 { Faker::Address.street_name }
    address_line_2 { Faker::Address.city }
    address_line_3 { Faker::Address.uk_county }
    zip_code { Faker::Address.zip_code }
    country { FactoryGirl.create(:country) }
  end
end