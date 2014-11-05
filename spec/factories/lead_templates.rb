FactoryGirl.define do
  factory :lead_template do
    category { create(:lead_category) }
    name 'test'
    creator { create(:agent) }
  end
end
