FactoryGirl.define do
  factory :bank_account do
    sequence(:bank_name) { |n| "bank_name_#{n}" }
    iban_no { Faker.numerify('###################') }
    local_bank_number { Faker.numerify('#########') }
    swift { Faker.letterify('????????').upcase }
    address { FactoryGirl.create(:address) }
  end
end