require 'spec_helper'

describe SubscriptionSubPeriod do
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

  context "subperiods" do
    before(:each) do
      @free_subscription = SubscriptionPlan.active.free.for_role("supplier").first
      @payable_subscription1 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :subscription_period => 12, :billing_cycle => 12)
      @payable_subscription1.subscription_plan_lines.make!(:price => 25)
      @payable_subscription2 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :subscription_period => 12, :billing_cycle => 3)
      @payable_subscription2.subscription_plan_lines.make!(:price => 99)
      @payable_subscription3 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :subscription_period => 12)
      @payable_subscription3.subscription_plan_lines.make!(:price => 200)
    end

    it "should generate correct number of sub periods" do
      setup_customer(@free_subscription)
      @customer.active_subscription.subscription_sub_periods.count.should eql(1)
      @customer.upgrade_subscription!(@payable_subscription1)
      @customer.active_subscription.subscription_sub_periods.count.should eql(1)
      @customer.upgrade_subscription!(@payable_subscription2)
      @customer.active_subscription.subscription_sub_periods.count.should eql(4)
      @customer.upgrade_subscription!(@payable_subscription3)
      @customer.active_subscription.subscription_sub_periods.count.should eql(1)
    end

    it "should generate subperiods with correct start and end dates" do
      setup_customer(@free_subscription)
      @customer.active_subscription.subscription_sub_periods.first.start_date.should eql(@customer.active_subscription.start_date)
      @customer.active_subscription.subscription_sub_periods.first.end_date.should be_nil
      @customer.upgrade_subscription!(@payable_subscription2)
      @customer.active_subscription.subscription_sub_periods[0].start_date.should eql(@customer.active_subscription.start_date)
      @customer.active_subscription.subscription_sub_periods[0].end_date.should eql(@customer.active_subscription.start_date + 3.weeks - 1.day)
      @customer.active_subscription.subscription_sub_periods[1].start_date.should eql(@customer.active_subscription.start_date + 3.weeks)
      @customer.active_subscription.subscription_sub_periods[1].end_date.should eql(@customer.active_subscription.start_date + 6.weeks - 1.day)
      @customer.active_subscription.subscription_sub_periods[2].start_date.should eql(@customer.active_subscription.start_date + 6.weeks)
      @customer.active_subscription.subscription_sub_periods[2].end_date.should eql(@customer.active_subscription.start_date + 9.weeks - 1.day)
      @customer.active_subscription.subscription_sub_periods[3].start_date.should eql(@customer.active_subscription.start_date + 9.weeks)
      @customer.active_subscription.subscription_sub_periods[3].end_date.should eql(@customer.active_subscription.end_date)
    end

    it "should generate line items for each subperiod" do
      setup_customer(@payable_subscription2)
      @customer.active_subscription.subscription_sub_periods.each do |sp|
        sp.subscription_plan_lines.count.should eql(@customer.active_subscription.subscription_plan_lines.count)
      end
    end

    it "should generate items with same prices and names as in subscription plan for each subperiod'" do
      setup_customer(@payable_subscription1)
      subscription_spls = @customer.active_subscription.subscription_plan_lines
      @customer.active_subscription.subscription_sub_periods.each do |sp|
        period_spls = sp.subscription_plan_lines
        period_spls.map(&:price).should eql(subscription_spls.map(&:price))
        period_spls.map(&:name).should eql(subscription_spls.map(&:name))
      end
    end

    it "should cache prices of all lines in subperiod" do
      setup_customer(@payable_subscription2)
      @customer.active_subscription.subscription_sub_periods.each do |sp|
        sp.billing_price.should eql(sp.subscription_plan_lines.sum(:price))
        sp.euro_billing_price.should eql(sp.currency.to_euro(sp.billing_price))
      end
    end

    it "should contain cached price equal to total subscription price" do
      @payable_subscription = SubscriptionPlan.make!(:assigned_roles => [:supplier], :subscription_period => 9, :billing_cycle => 3)
      @payable_subscription.subscription_plan_lines.make!(:price => 9.99)
      setup_customer(@payable_subscription)
      @customer.active_subscription.subscription_sub_periods.sum(:billing_price).should eql(@customer.active_subscription.billing_price)
    end

  end

end