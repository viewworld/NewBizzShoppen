FactoryGirl.define do
  factory :region do
    name { Faker::AddressDA.region }
  end
end
