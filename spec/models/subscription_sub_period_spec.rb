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
      @payable_subscription1.subscription_plan_lines.make!(:price => 15)
      @payable_subscription2 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :subscription_period => 12, :billing_cycle => 3)
      @payable_subscription2.subscription_plan_lines.make!(:price => 21.36)
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

    it "should generate items with same prices and names as in subscription plan for each subperiod" do
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
      @payable_subscription = SubscriptionPlan.make!(:assigned_roles => [:supplier], :subscription_period => 105, :billing_cycle => 5)
      @payable_subscription.subscription_plan_lines.make!(:price => 25.83)
      setup_customer(@payable_subscription)
      @customer.active_subscription.subscription_sub_periods.sum(:billing_price).should eql(@customer.active_subscription.billing_price)
    end

    it "should recalculate subperiod when upgrading" do
      sp = SubscriptionPlan.make!(:subscription_period => 12, :billing_cycle => 3)
      sp.subscription_plan_lines.make!(:price => 9)
      sp.subscription_plan_lines.make!(:price => 21.36)
      sp.reload
      setup_customer(sp)
      set_date_today_to(Date.today + 2.weeks)
      @customer.upgrade_subscription!(@payable_subscription3)
      @prev_subscription.reload
      @prev_subscription.subscription_sub_periods.first.billing_price.should eql(5.06)
    end

    it "should recalculate subperiod when upgrading" do
      sp = SubscriptionPlan.make!(:subscription_period => 12, :billing_cycle => 3, :use_paypal => true)
      sp.subscription_plan_lines.make!(:price => 9)
      sp.subscription_plan_lines.make!(:price => 21.36)
      sp.reload
      setup_customer(sp)

      #paypal payment
      @customer.active_subscription.confirm_paypal!
      @prev_subscription = @customer.active_subscription
      @customer.active_subscription.subscription_sub_periods.first.update_attribute(:paypal_paid_auto, true)

      set_date_today_to(Date.today + 2.weeks)
      Subscription.any_instance.expects(:cancel_paypal_profile).returns(nil).at_least(1)
      expect {
        @customer.upgrade_subscription!(@payable_subscription3)
      }.to change { Refund.count }.by(1)

      @prev_subscription.reload
      @prev_subscription.subscription_sub_periods.first.refund.refund_price.should == 2.53
      @prev_subscription.subscription_sub_periods.first.refund.description.should match /Refund for unused 14 days/
      @prev_subscription.subscription_sub_periods.first.billing_price.should eql(5.06)
    end

    it "should delete all unused subperiods" do
      sp = SubscriptionPlan.make!(:subscription_period => 12, :billing_cycle => 3)
      sp.subscription_plan_lines.make!(:price => 9)
      sp.subscription_plan_lines.make!(:price => 21.36)
      sp.reload
      setup_customer(sp)
      set_date_today_to(Date.today + 2.weeks)
      @customer.upgrade_subscription!(@payable_subscription3)
      @prev_subscription.reload
      @prev_subscription.subscription_sub_periods.count.should eql(1)
    end

    it "should generate invoice based on the values in sub periods of all the billable subscriptions when no paypal" do
      @payable_subscription1.update_attribute(:use_paypal, false)
      setup_customer(@payable_subscription1)

      @invoice = Invoice.create(:user_id => @customer.id)
      @invoice.invoice_lines.size.should == @customer.active_subscription.subscription_sub_periods[0].subscription_plan_lines.size
      @invoice.invoice_lines.first.netto_price.should == @customer.active_subscription.subscription_sub_periods[0].subscription_plan_lines.first.price
      @invoice.invoice_lines.first.name.should == @customer.active_subscription.subscription_sub_periods[0].subscription_plan_lines.first.name
      @invoice.should_not be_paid
    end

    it "should generate invoice based on the values in sub period of the subscription handled by paypal" do
      @payable_subscription2.update_attribute(:use_paypal, true)
      setup_customer(@payable_subscription2)

      #subperiod is payed by paypal
      @customer.active_subscription.confirm_paypal!
      @customer.active_subscription.subscription_sub_periods.first.update_attribute(:paypal_paid_auto, true)

      @invoice = @customer.active_subscription.subscription_sub_periods.first.invoice
      @invoice.invoice_lines.size.should == @customer.active_subscription.subscription_sub_periods[0].subscription_plan_lines.size
      @invoice.invoice_lines.first.netto_price.should == @customer.active_subscription.subscription_sub_periods[0].subscription_plan_lines.first.price
      @invoice.invoice_lines.first.name.should == @customer.active_subscription.subscription_sub_periods[0].subscription_plan_lines.first.name
      @invoice.should be_paid
    end

    it "should generate the subperiod with correct billing dates when NO billing date +/- is present in subscription" do
      @payable_subscription2.update_attribute(:billing_period, 0)
      setup_customer(@payable_subscription2)

      @customer.active_subscription.subscription_sub_periods.each do |subscription_sub_periods|
        subscription_sub_periods.billing_date.should == subscription_sub_periods.start_date
      end
    end

    it "should generate the subperiod with correct billing dates when billing date +1 week is present in subscription" do
      @payable_subscription2.update_attribute(:billing_period, 1)
      setup_customer(@payable_subscription2)

      @customer.active_subscription.subscription_sub_periods.each do |subscription_sub_periods|
        subscription_sub_periods.billing_date.should == subscription_sub_periods.start_date + 1.week
      end
    end

    it "should generate the subperiod with correct billing dates when billing date -1 week is present in subscription" do
      @payable_subscription2.update_attribute(:billing_period,  -1)
      setup_customer(@payable_subscription2)

      @customer.active_subscription.subscription_sub_periods[0].billing_date.should == @customer.active_subscription.subscription_sub_periods[0].start_date

      @customer.active_subscription.subscription_sub_periods[1..@customer.active_subscription.subscription_sub_periods.size].each do |subscription_sub_periods|
        subscription_sub_periods.billing_date.should == subscription_sub_periods.start_date - 1.week
      end
    end

    it "should generate unpaid invoice when number of retries is exceeded" do
      @payable_subscription2.update_attributes(:use_paypal => true, :paypal_retries => 2)
      setup_customer(@payable_subscription2)
      @customer.active_subscription.confirm_paypal!

      expect {
        @customer.active_subscription.subscription_sub_periods[0].update_attribute(:paypal_retries, 0)
      }.to change { Invoice.count }.by(1)

      @customer.active_subscription.subscription_sub_periods[0].invoice.should_not be_paid
    end

    it "should auto downgrade when number of retries is exceeded AND auto downgrading is enabled" do
      @payable_subscription4 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :subscription_period => 12)
      @payable_subscription4.subscription_plan_lines.make!(:price => 200)
      @payable_subscription2.update_attributes(:use_paypal => true, :paypal_retries => 2, :automatic_downgrading => true,
                                               :automatic_downgrade_subscription_plan_id => @payable_subscription4.id)

      setup_customer(@payable_subscription2)
      @customer.active_subscription.confirm_paypal!
      @prev_subscription = @customer.active_subscription

      Subscription.any_instance.expects(:cancel_paypal_profile).returns(nil)
      @customer.active_subscription.subscription_sub_periods[0].update_attribute(:paypal_retries, 0)

      @customer.active_subscription.subscription_plan.should == @payable_subscription4
      @prev_subscription.reload
      @prev_subscription.should be_downgraded_paypal
      @customer.active_subscription.should be_normal
    end

    it "should generate paid invoice when marked as paid by paypal IPN and send email to user" do
      @payable_subscription2.update_attributes(:use_paypal => true)
      setup_customer(@payable_subscription2)
      @customer.active_subscription.confirm_paypal!

      expect {
        @customer.active_subscription.subscription_sub_periods[0].update_attribute(:paypal_paid_auto, true)
      }.to change { Invoice.count }.by(1)

      @customer.active_subscription.subscription_sub_periods[0].invoice.should be_paid

      ActionMailer::Base.deliveries.last.to.should include(@customer.email)
    end
  end

end