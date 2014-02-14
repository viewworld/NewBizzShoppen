FactoryGirl.define do
  factory :user do
    password 'secret'
    password_confirmation 'secret'
    phone { Faker::PhoneNumber.phone_number }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    agreement_read true
    skip_email_verification '1'
  end

  factory :agent, :class => User::Agent, :parent => :user do
    sequence(:email) { |n| "agent#{n}@fairpeople.com" }
    roles_mask 1026
    address {
      country = FactoryGirl.create(:vat_rate).country
      FactoryGirl.create(:address, :country => country)
    }
  end

  factory :category_supplier, :class => User::CategorySupplier, :parent => :user do
    sequence(:email) { |n| "category_supplier#{n}@fairpeople.com" }
    roles_mask 256
    sequence(:company_name) { |n| "comapny_name_#{n}" }
    address {
      country = FactoryGirl.create(:vat_rate).country
      FactoryGirl.create(:address, :country => country)
    }
    assign_free_subscription_plan true
    countries { [country] }
  end
end