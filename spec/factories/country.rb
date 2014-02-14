FactoryGirl.define do
  factory :country do
    sequence(:name) { |n| "country_#{n}" }
    locale 'en'
  end
end