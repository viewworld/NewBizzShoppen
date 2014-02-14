FactoryGirl.define do
  factory :subscription_plan do
    sequence(:name) { |n| "subscription_plan_#{n}" }
    assigned_roles { :category_supplier }
    subscription_period 0
    lockup_period 2
    billing_period 0
    free_period 0
    currency_id { FactoryGirl.create(:currency) }
    is_active true
    can_be_upgraded true
    can_be_downgraded true
    team_buyers false
    big_buyer false
    deal_maker false
    newsletter_manager false
    seller { FactoryGirl.create(:seller) }
    paypal_retries 1
  end
end