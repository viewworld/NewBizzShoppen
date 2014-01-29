require 'spec_helper'

describe SubscriptionPlan do
  fixtures :all

  def set_date_today_to(date)
    Date.stubs(:today).returns(date)
  end

  context "validations" do
    it "should validate if subscription_period will divide by billing_cycle" do
      SubscriptionPlan.make(:subscription_period => 52, :billing_cycle => 52).should be_valid
      SubscriptionPlan.make(:subscription_period => 52, :billing_cycle => 13).should be_valid
      SubscriptionPlan.make(:subscription_period => 52, :billing_cycle => 1).should be_valid
      SubscriptionPlan.make(:subscription_period => 52, :billing_cycle => 51).should_not be_valid
    end

    it "should cache the total amount" do
      sp = SubscriptionPlan.make!(:subscription_period => 12, :billing_cycle => 3)
      sp.subscription_plan_lines.make!(:price => 9)
      sp.subscription_plan_lines.make!(:price => 21.36)
      sp.reload
      sp.billing_price.should eql(30.36*4)
    end
  end

end