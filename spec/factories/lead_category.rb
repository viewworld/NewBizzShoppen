FactoryGirl.define do
  factory :lead_category do
    sequence(:name) { |n| "lead_category_#{n}" }
    description { Faker::Lorem.sentences(4) }
    default_price 0.0
    currency { FactoryGirl.create(:currency) }
  end
end