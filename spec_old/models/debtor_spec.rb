require 'spec_helper'

describe Debtor do
  fixtures :all

  def setup_customer(subscription_plan, attributes={})
    attrs_hash = { :subscription_plan_id => subscription_plan.id }.merge!(attributes)
    @customer = User::Supplier.make!(attrs_hash)
    @customer.active_subscription.subscription_plan.should == subscription_plan
    @prev_subscription = @customer.active_subscription
  end

  def set_date_today_to(date)
    Date.stubs(:today).returns(date)
  end

  context "subscriptions" do
    before(:each) do
      @free_subscription = SubscriptionPlan.active.free.for_role("supplier").first
      @payable_subscription1 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :subscription_period => 12, :billing_cycle => 12, :use_paypal => false, :billing_period => 0)
      @payable_subscription1.subscription_plan_lines.make!(:price => 15)
      @payable_subscription2 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :subscription_period => 12, :billing_cycle => 3, :use_paypal => false, :billing_period => 0)
      @payable_subscription2.subscription_plan_lines.make!(:price => 21.36)
      @payable_subscription3 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :subscription_period => 12, :billing_cycle => 3, :use_paypal => true, :billing_period => 0)
      @payable_subscription3.subscription_plan_lines.make!(:price => 200)
    end

    it "should generate debt when subscription does not use paypal" do
      setup_customer(@payable_subscription1)
      Debtor.with_owner(@customer).sum(:price).should == 15
      @customer.upgrade_subscription!(@payable_subscription2)
      Debtor.with_owner(@customer).sum(:price).should == 21.36 # 21.36 is for every period
    end

    it "should not generate debt when subscription use paypal" do
      setup_customer(@payable_subscription3)
      Debtor.with_owner(@customer).sum(:price).should == 0
    end
  end
end