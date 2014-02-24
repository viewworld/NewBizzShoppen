FactoryGirl.define do
  factory :email_template do
    sequence(:name) { |n| "email_template_#{n}" }
    subject { name }
    from 'admin@fairleads.com'
    bcc ''
    cc ''
    body { Faker::Lorem.sentences(4) }
    template nil
    uniq_id { name }
    persist true
    resource nil
    custom_reply_to false

    trait :global do
      resource_id nil
      resource_type nil
    end
  end
end
