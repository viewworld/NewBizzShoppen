require 'spec_helper'

describe PaypalRecurringPayment do
  fixtures :all

  context "initialization" do

    before(:each) do
      @sp = SubscriptionPlan.make!(:subscription_period => 9, :billing_cycle => 3, :free_period => 0)
      @sp.subscription_plan_lines.make!(:price => 120)
    end

    it "should not add free period options for subscription plan without free period" do
      customer = User::Supplier.make!(:subscription_plan_id => @sp.id, :vat_number => '123')
      paypal_recurring = PaypalRecurringPayment.new(:subscription_plan => @sp, :user => customer, :token => "ABC", :payer_id => "123",
                                                    :ipn_url => 'http://localhost')
      paypal_recurring.free_period_hash.should == {}
    end

    it "should add free period options for subscription plan with free period" do
      sp_free = SubscriptionPlan.make!(:subscription_period => 9, :billing_cycle => 3, :free_period => 1)
      sp_free.subscription_plan_lines.make!(:price => 120)
      customer = User::Supplier.make!(:subscription_plan_id => sp_free.id, :vat_number => '123')
      paypal_recurring = PaypalRecurringPayment.new(:subscription_plan => sp_free, :user => customer, :token => "ABC", :payer_id => "123",
                                                    :ipn_url => 'http://localhost')
      paypal_recurring.free_period_hash.should == {
          :trial_amount => 0.0,
          :trial_total_billing_cycles => 1,
          :trial_billing_period => :daily,
          :trial_billing_frequency => 1
      }
    end

    it "should receive valid checkout response" do
      paypal_recurring = PaypalRecurringPayment.new(:subscription_plan => @sp,
                                                    :return_url => 'http://localhost',
                                                    :cancel_url => 'http://localhost',
                                                    :ipn_url => 'http://localhost/ipn')
      paypal_recurring.checkout?.should be_true
    end

    it "should contain token and checkout url in response" do
      paypal_recurring = PaypalRecurringPayment.new(:subscription_plan => @sp,
                                                    :return_url => 'http://localhost',
                                                    :cancel_url => 'http://localhost',
                                                    :ipn_url => 'http://localhost/ipn')
      paypal_recurring.checkout?
      paypal_recurring.checkout_url.should include("www.sandbox.paypal.com/cgi-bin")
      paypal_recurring.checkout_url.should include("token=EC")
    end


  end

end