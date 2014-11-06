FactoryGirl.define do
  factory :softphone do
    user { create(:agent) }
    softphone_server { create(:softphone_server) }
  end
end
