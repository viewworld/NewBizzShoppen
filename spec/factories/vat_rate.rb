FactoryGirl.define do
  factory :vat_rate do
    association :country
    rate 23.0
  end
end
