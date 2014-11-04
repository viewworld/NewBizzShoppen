FactoryGirl.define do
  factory :invoice, class: Invoice do
    user { create(:call_centre) }
    seller { create(:seller) }
    bank_account { create(:bank_account) }
    currency { create(:currency) }

    after :build do |invoice|
      invoice.invoice_lines <<  build(:invoice_line, invoice: invoice)
    end
  end
end
