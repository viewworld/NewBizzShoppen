FactoryGirl.define do
  factory :payment_transaction do
    invoice { create(:invoice) }
    amount 1
    paid_at DateTime.now
  end

  factory :manual_transaction, class: ManualTransaction, parent: :payment_transaction do
    type 'ManualTransaction'
  end
end
