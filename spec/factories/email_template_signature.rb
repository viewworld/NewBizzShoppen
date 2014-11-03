FactoryGirl.define do
  factory :email_template_signature do
    sequence(:name) { |i| "email_template_signature_#{i}" }
    body { Faker::Lorem.paragraphs }
    email_from { Faker::Internet.email }
  end
end
