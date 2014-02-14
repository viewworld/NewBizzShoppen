FactoryGirl.define do
  factory :currency do
    sequence(:name) { |n| "currency_#{n}" }
    symbol { %w(&euro; &pound; $)[rand(3)] }
    active true
    exchange_rate 1
    global_default true
  end
end