FactoryGirl.define do
  factory :country do
    sequence(:name) { |n| "country_#{n}" }
    locale 'en'
    work_start_at (Time.zone.at(0) + 8.hours)
    work_end_at (Time.zone.at(0) + 15.hours + 24.minutes)
  end
end
