FactoryGirl.define do
  factory :softphone_server do
    sequence(:name) { |n| "sofphone_server_#{n}" }
    server_host { Faker::Internet.ip_v4_address }
    server_port { rand(1000..9999) }
    sip_domain { Faker::Internet.domain_name }
    sip_port { rand(1000..9999) }
  end
end
