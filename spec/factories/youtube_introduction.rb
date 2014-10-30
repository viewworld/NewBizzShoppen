FactoryGirl.define do
  factory :youtube_introduction do
    url { Faker::Internet.http_url }
    locale_code :en
    site "fairleads.dk"
  end
end
