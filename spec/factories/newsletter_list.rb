FactoryGirl.define do
  factory :newsletter_list do
    sequence(:name) { |n| "newsletter_list_#{n}" }
    owner { FactoryGirl.create(:call_centre) }
    creator { FactoryGirl.create(:admin) }
  end
end