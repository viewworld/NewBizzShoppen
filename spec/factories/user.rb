FactoryGirl.define do
  factory :user do
    password 'secret'
    password_confirmation 'secret'
    phone { Faker::PhoneNumber.phone_number }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    agreement_read true
    skip_email_verification '1'
    sequence(:company_name) { |n| "company_name_#{n}" }
    address do
      country = FactoryGirl.create(:vat_rate).country
      FactoryGirl.create(:address, :country => country)
    end
  end

  factory :admin, :class => User::Admin, :parent => :user do
    sequence(:email) { |n| "admin_#{n}@fairpeople.com" }
  end

  factory :agent, :class => User::Agent, :parent => :user do
    sequence(:email) { |n| "agent_#{n}@fairpeople.com" }
    roles_mask 1026
  end

  factory :call_centre, :class => User::CallCentre, :parent => :user do
    sequence(:email) { |n| "call_centre_#{n}@fairpeople.com" }
    roles_mask 1028
    phone { Faker::PhoneNumber.phone_number }
    payout 100
    bank_address { FactoryGirl.create(:bank_address, :country => country) }
  end

  factory :category_supplier, :class => User::CategorySupplier, :parent => :user do
    sequence(:email) { |n| "category_supplier_#{n}@fairpeople.com" }
    roles_mask 256
    assign_free_subscription_plan true
    countries { [country] }
  end
end
