FactoryGirl.define do
  factory :login_time_request do
    whole_day '0'
    start_time Time.zone.parse('2014-01-13 10:00')
    end_time Time.zone.parse('2014-01-13 11:00')
    campaign_id { FactoryGirl.create(:campaign) }
    creator { FactoryGirl.create(:agent) }
    user { creator }
  end

  factory :login_time_request_whole_day, :class => LoginTimeRequest, :parent => :login_time_request do
    whole_day '1'
    whole_day_start_time (Time.zone.at(0) + 8.hours)
    whole_day_end_time (Time.zone.at(0) + 15.hours + 24.minutes)
    whole_day_start_date Time.zone.parse('2014-01-13')
    whole_day_end_date Time.zone.parse('2014-01-13')
  end
end
