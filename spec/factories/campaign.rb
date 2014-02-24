FactoryGirl.define do
  factory :campaign do
    state 'active'
    category { FactoryGirl.create(:lead_category) }
    cost_type Campaign::NO_COST
    max_contact_number 5
    country { FactoryGirl.create(:country) }
    sequence(:name) { |n| "campaign_#{n}" }
    creator { FactoryGirl.create(:call_centre) }
    currency { FactoryGirl.create(:currency) }
  end
end