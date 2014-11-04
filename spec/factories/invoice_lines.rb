FactoryGirl.define do
  factory :invoice_line do
    name 'test'
    netto_price 1
    quantity 1
    invoice { create(:invoice) }
  end
end
