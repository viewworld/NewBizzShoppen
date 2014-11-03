FactoryGirl.define do
  factory :email_template_signature do
    body { Faker::Lorem.paragraphs }
    name { Faker::Lorem.words }
    email_from { Faker::Internet.email }
  end
end
