require 'spec_helper'

describe SubscriptionPlanLine do
  fixtures :all

  def set_date_today_to(date)
    Date.stubs(:today).returns(date)
  end

  context "validations" do
    it "should validate if price will divide by number of billing_cycles" do
      sp = SubscriptionPlan.make(:subscription_period => 9, :billing_cycle => 3)
      sp.subscription_plan_lines << SubscriptionPlanLine.make(:price => 8)
      sp.subscription_plan_lines << SubscriptionPlanLine.make(:price => 9)
      sp.subscription_plan_lines << SubscriptionPlanLine.make(:price => 21.36)

      sp.should_not be_valid
    end
  end

end