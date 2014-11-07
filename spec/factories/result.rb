FactoryGirl.define do
  factory :result do
    sequence(:name) { |n| "result_#{n}" }
    is_archived false
    is_global false
  end
end
