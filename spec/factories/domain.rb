FactoryGirl.define do
  factory :domain do
    sequence(:site) { |n| "example-#{n}" }
    sequence(:name) { |n| "#{site}.com" }

    trait :default do
      default true
    end

    trait :english do
      locale 'en'
    end

    trait :danish do
      locale 'da'
    end
  end
end
