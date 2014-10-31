FactoryGirl.define do
  factory :vat_rate do
    country { FactoryGirl.create(:country) }
    rate 23.0
  end
end
