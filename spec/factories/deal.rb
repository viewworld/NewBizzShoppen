FactoryGirl.define do
  factory :deal do
    start_date DateTime.now
    end_date DateTime.now
    email_address 'test@test.pl'
    deal_price 1
    discounted_price 1
    created_leads 1
    header 'test'
    company_name 'test'
    contact_name 'test'
    phone_number 333333333
    country { create(:country) }
    currency { create(:currency) }
    address_line_1 'test'
    address_line_3 'test'
    zip_code 'test'
    creator { create(:agent) }
    validate_contact_email false
    notify_suppliers_after_update false
  end
end
