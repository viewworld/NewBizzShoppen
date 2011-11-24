require 'spec_helper'

describe SubscriptionPlanLine do
  fixtures :all

  def set_date_today_to(date)
    Date.stubs(:today).returns(date)
  end

  context "validations" do
    it "should validate if price will divide by number of billing_cycles" do
      SubscriptionPlan.make!(:subscription_period => 9, :billing_cycle => 3).subscription_plan_lines.make!(:price => 8).should_not be_valid
    end
  end

end