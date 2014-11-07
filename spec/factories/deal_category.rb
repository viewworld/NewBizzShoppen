FactoryGirl.define do
  factory :deal_category do
    sequence(:name) { |n| "deal_category_#{n}" }
    description { Faker::Lorem.sentences(4) }
  end
end
