require 'spec_helper'

describe Subscription do
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

  context "calculations" do
    it "should yield correct billing price" do
      @payable_subscription1 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12, :can_be_upgraded => false)
      @payable_subscription1.subscription_plan_lines.make!(:price => 25)
      @payable_subscription1.subscription_plan_lines.make!(:price => 5)

      @payable_subscription1.total_billing.should.eql?(30)
      @customer = User::Supplier.make!(:subscription_plan_id => @payable_subscription1.id)
      @customer.active_subscription.total_billing.should.eql?(30)
    end

    context "dates" do
      before(:each) do
        @payable_subscription1 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12)
        @payable_subscription1.subscription_plan_lines.make!(:price => 25)
        @payable_subscription2 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12)
        @payable_subscription2.subscription_plan_lines.make!(:price => 100)
      end

      it "should assign correct dates without free period" do
        setup_customer(@payable_subscription1)
        @customer.active_subscription.start_date.should == Date.today
        @customer.active_subscription.end_date.should == Date.today + 12.weeks
      end

      it "should assign correct dates with free period only once per VAT number" do
        @payable_subscription1.update_attribute(:free_period, 2)
        @payable_subscription2.update_attribute(:free_period, 3)
        setup_customer(@payable_subscription1, { :vat_number => "VAT39438928282" })
        @customer.active_subscription.start_date.should == Date.today
        @customer.active_subscription.end_date.should == Date.today + 14.weeks
        @customer.has_free_period_available?.should be_false
        @customer.upgrade_subscription!(@payable_subscription2)
        @customer.active_subscription.end_date.should == Date.today + 12.weeks
      end
    end
  end


  context "user signup and subscription selection" do
    before(:each) do
      @subscription_plan = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12)
      @subscription_plan_2 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 10)
      @free_subscription = SubscriptionPlan.active.free.for_role("supplier").first
    end

    it "should be assigned after creation" do
      @customer = User::Supplier.make!(:subscription_plan_id => @subscription_plan.id)
      @customer.active_subscription.subscription_plan.should == @subscription_plan
    end

    it "should be assigned free when specified during creation" do
      @customer = User::Supplier.make!(:subscription_plan_id => @free_subscription.id)
      @customer.active_subscription.subscription_plan.should == @free_subscription
    end

    it "should be applied accordingly to user's role" do
      @member_subscription = SubscriptionPlan.make!(:assigned_roles => [:member], :billing_cycle => 12)
      @customer = User::Supplier.make(:subscription_plan_id => @member_subscription.id, :assign_free_subscription_plan => false)
      @customer.save
      @customer.should_not be_valid
      @customer.should have(1).error_on(:subscription_plan_id)
    end

    it "should always be assigned to user during creation" do
      @customer = User::Supplier.make(:subscription_plan_id => nil, :assign_free_subscription_plan => false)
      @customer.save
      @customer.should_not be_valid
      @customer.should have(1).error_on(:subscription_plan_id)

      @member = User::Member.make(:subscription_plan_id => nil, :assign_free_subscription_plan => false)
      @member.save
      @member.should_not be_valid
      @member.should have(1).error_on(:subscription_plan_id)
    end
  end

  context "subscription transitions" do

    before(:each) do
      @payable_subscription1 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12)
      @payable_subscription1.subscription_plan_lines.make!(:price => 25)
      @payable_subscription2 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12)
      @payable_subscription2.subscription_plan_lines.make!(:price => 100)
    end

    context "upgrade" do
      it "should be upgraded if new one is more expensive" do
        setup_customer(@payable_subscription1)
        @customer.active_subscription.should be_normal
        @customer.upgrade_subscription!(@payable_subscription2)
        @prev_subscription.reload
        @prev_subscription.should be_upgraded
        @prev_subscription.end_date.should == Date.today-1
        @customer.active_subscription.start_date.should == Date.today
        @customer.active_subscription.end_date.should == Date.today + 12.weeks
        @customer.active_subscription.subscription_plan.should == @payable_subscription2
      end

      it "should be upgraded when in lockup" do
        @payable_subscription1.update_attribute(:lockup_period, 2)
        setup_customer(@payable_subscription1)
        set_date_today_to(@customer.active_subscription.lockup_start_date)
        @customer.active_subscription.enter_lockup!
        @customer.active_subscription.should be_lockup
        @customer.upgrade_subscription!(@payable_subscription2)
        @prev_subscription.reload
        @prev_subscription.should be_upgraded
        @customer.active_subscription.should be_normal
      end

      it "should be upgraded when in penalty to noncancelable and from that to another noncancelable" do
        @payable_subscription3 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12)
        @payable_subscription3.subscription_plan_lines.make!(:price => 200)
        @payable_subscription4 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12)
        @payable_subscription4.subscription_plan_lines.make!(:price => 300)
        @payable_subscription1.update_attribute(:lockup_period, 2)
        setup_customer(@payable_subscription1)
        set_date_today_to(@customer.active_subscription.lockup_start_date)
        @customer.active_subscription.enter_lockup!
        @customer.cancel_subscription!
        @customer.active_subscription.should be_cancelled_during_lockup
        @penalty_subscription = @customer.subscriptions.order("position").last
        @penalty_subscription.should be_penalty
        set_date_today_to(@penalty_subscription.start_date)
        @customer.upgrade_subscription!(@payable_subscription3)
        @customer.active_subscription.should be_non_cancelable
        @penalty_subscription.reload
        @penalty_subscription.should be_upgraded_from_penalty
        @customer.upgrade_subscription!(@payable_subscription4)
        @customer.active_subscription.subscription_plan.should == @payable_subscription4
        @customer.active_subscription.should be_non_cancelable
      end

      it "should NOT be upgraded if new one is for different role" do
        @payable_subscription2.update_attribute(:assigned_roles, [:member])
        setup_customer(@payable_subscription1)
        @customer.active_subscription.should be_normal
        @customer.upgrade_subscription!(@payable_subscription2)
        @prev_subscription.reload
        @prev_subscription.should be_normal
        @customer.active_subscription.subscription_plan.should == @payable_subscription1
      end

      it "should NOT be upgraded if active subscription doesn't allow upgrade" do
        @payable_subscription1.update_attribute(:can_be_upgraded, false)
        setup_customer(@payable_subscription1)
        @customer.upgrade_subscription!(@payable_subscription2)
        @prev_subscription.reload
        @prev_subscription.should be_normal
      end

      it "should recalculate subscription price if the billing cycle was not complete" do
        setup_customer(@payable_subscription1)
        set_date_today_to(Date.today+43.days)
        @customer.active_subscription.update_attribute(:billing_date, Date.today)
        @customer.upgrade_subscription!(@payable_subscription2)
        @prev_subscription.reload
        @prev_subscription.should be_upgraded
        @prev_subscription.end_date.should == Date.today-1
        @prev_subscription.billing_date.should == Date.today
        @prev_subscription.subscription_plan_lines.sum(:price).should == 12.5
        @prev_subscription.billing_price.should == 12.5
      end

      it "should create credit note for unused amount of subscription" do
        setup_customer(@payable_subscription1)
        @customer.active_subscription.update_attribute(:billing_date, Date.today)
        @invoice = Invoice.create(:user => @customer)

        expect{
          @customer.upgrade_subscription!(@payable_subscription2)
        }.to change{ Refund.count }.by(1)

        @customer.active_subscription.update_attribute(:billing_date, Date.today)

        Currency.all.each { |c| c.update_attribute(:exchange_rate, 1.0)}

        @invoice = Invoice.create(:user => @customer)
        invoice_line_for_refund = @invoice.invoice_lines.detect { |l| l.payable.is_a?(Refund) }
        invoice_line_for_refund.should_not be_nil
        invoice_line_for_refund.netto_price.should < 0
      end

    end

    context "downgrade" do
      it "should be downgraded if new one is less expensive" do
        setup_customer(@payable_subscription2)
        @customer.active_subscription.should be_normal
        @customer.downgrade_subscription!(@payable_subscription1)
        @prev_subscription.reload
        @prev_subscription.should be_downgraded
        @prev_subscription.end_date.should == Date.today + 12.weeks
        @customer.active_subscription.subscription_plan.should == @payable_subscription2
        @customer.subscriptions.last.subscription_plan.should == @payable_subscription1
        @customer.subscriptions.last.start_date.should == @prev_subscription.end_date + 1
        @customer.subscriptions.last.end_date.should == (@prev_subscription.end_date + 1) + 12.weeks
      end

      it "should NOT be downgraded if new one is for different role" do
        @payable_subscription1.update_attribute(:assigned_roles, [:member])
        setup_customer(@payable_subscription2)
        @customer.active_subscription.should be_normal
        @customer.downgrade_subscription!(@payable_subscription1)
        @prev_subscription.reload
        @prev_subscription.should be_normal
        @customer.active_subscription.subscription_plan.should == @payable_subscription2
      end

      it "should NOT be downgraded if active subscription doesn't allow downgrade" do
        @payable_subscription2.update_attribute(:can_be_downgraded, false)
        setup_customer(@payable_subscription2)
        @customer.downgrade_subscription!(@payable_subscription1)
        @prev_subscription.reload
        @prev_subscription.should be_normal
      end
    end

    context "lockup" do
      it "should enter lockup state if lockup period is defined and today's date is greater or equal to it" do
        @payable_subscription1.update_attribute(:lockup_period, 2)
        setup_customer(@payable_subscription1)
        set_date_today_to(@customer.active_subscription.lockup_start_date)

        @customer.active_subscription.enter_lockup!
        @customer.active_subscription.should be_lockup
      end

      it "should NOT enter lockup when none is defined" do
        setup_customer(@payable_subscription1)
        @customer.active_subscription.enter_lockup!
        @customer.active_subscription.should_not be_lockup
      end

      it "should NOT enter lockup when today's date is less than it" do
        @payable_subscription1.update_attribute(:lockup_period, 2)
        setup_customer(@payable_subscription1)
        @customer.active_subscription.enter_lockup!
        @customer.active_subscription.should_not be_lockup
      end
    end

    context "cancel" do
      it "should be cancelled when in normal state and even on the same day as applied/upgrade" do
        setup_customer(@payable_subscription1)
        end_date = @customer.active_subscription.end_date
        @customer.cancel_subscription!
        @customer.active_subscription.should be_cancelled
        @customer.active_subscription.end_date.should == end_date
      end

      it "should prolong as free when cancelled" do
        setup_customer(@payable_subscription1)
        @customer.cancel_subscription!
        @customer.active_subscription.should be_cancelled
        set_date_today_to(@customer.active_subscription.end_date+1)
        @customer.active_subscription.should_not be_payable
      end

      it "should be cancelled when in lockup state and generate penalty" do
        @payable_subscription1.update_attribute(:lockup_period, 2)
        setup_customer(@payable_subscription1)
        set_date_today_to(@customer.active_subscription.lockup_start_date)
        @customer.active_subscription.enter_lockup!
        @customer.active_subscription.should be_lockup
        @customer.cancel_subscription!
        @customer.active_subscription.should be_cancelled_during_lockup
        @penalty_subscription = @customer.subscriptions.order("position").last
        @penalty_subscription.start_date.should == @customer.active_subscription.end_date + 1
        @penalty_subscription.end_date.should == @penalty_subscription.start_date + 12.weeks
        @penalty_subscription.should be_penalty
        @penalty_subscription.prolongs_as_free.should be_true
      end
    end

    context "prolong" do
      it "should be prolonged to the same subscription when payable subscription" do
        setup_customer(@payable_subscription1)
        set_date_today_to(@customer.active_subscription.end_date+1)
        #active_subscription auto prolongs when necessary
        @customer.active_subscription
        @prev_subscription.reload
        @prev_subscription.should be_prolonged
        @customer.active_subscription.should be_normal
        @customer.active_subscription.subscription_plan.should == @payable_subscription1
      end

      it "should be prolonged to free subscription when payable penalty" do
        @payable_subscription1.update_attribute(:lockup_period, 2)
        setup_customer(@payable_subscription1)
        set_date_today_to(@customer.active_subscription.lockup_start_date)
        @customer.active_subscription.enter_lockup!
        @customer.active_subscription.should be_lockup
        @customer.cancel_subscription!
        @customer.active_subscription.should be_cancelled_during_lockup
        set_date_today_to(@customer.subscriptions.order("position").last.end_date+1)
        #active_subscription auto prolongs when necessary
        @customer.active_subscription
        @customer.active_subscription.should_not be_payable
      end

      it "should NOT prolong when free subscription" do
        setup_customer(SubscriptionPlan.active.free.for_role("supplier").first)
        Subscription.auto_prolong
        @customer.active_subscription.should_not be_payable
        @customer.subscriptions.size.should == 1
      end

      it "should auto prolong subscriptions of all subscribers by rake task method" do
        @customer1 = User::Supplier.make!(:subscription_plan_id => @payable_subscription1.id)
        @customer2 = User::Supplier.make!(:subscription_plan_id => @payable_subscription1.id)

        set_date_today_to(Date.today+12.weeks+1)

        Subscription.auto_prolong

        @customer1.active_subscription.start_date.should == Date.today
        @customer2.active_subscription.start_date.should == Date.today
      end

      it "should bill total price when subscription is prolonged" do
        setup_customer(@payable_subscription1)
        set_date_today_to(@customer.active_subscription.end_date+1)
        @customer.active_subscription
        @prev_subscription.reload
        @prev_subscription.should be_prolonged
        @prev_subscription.subscription_plan_lines.sum(:price).should == 25.0
        @prev_subscription.billing_price.should == 25.0
      end
    end

    context "billing dates" do
      it "should set billing date to start date when billing period is 0" do
        @payable_subscription10 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12, :billing_period => 0)
        @payable_subscription10.subscription_plan_lines.make!(:price => 200)
        setup_customer(@payable_subscription10)
        @customer.active_subscription.billing_date.should == Date.today
      end

      it "should set billing date to start date + 1 week when billing period is 1" do
        @payable_subscription10 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12, :billing_period => 1)
        @payable_subscription10.subscription_plan_lines.make!(:price => 200)
        setup_customer(@payable_subscription10)
        @customer.active_subscription.billing_date.should == Date.today + 7
      end
    end

    context "subscription change by admin" do
      it "should change to less expensive even if the subscription plan does not allow downgrading" do
        @payable_subscription2.update_attribute(:can_be_downgraded, false)
        setup_customer(@payable_subscription2)
        @customer.admin_change_subscription!(@payable_subscription1)
        throw @customer.active_subscription.subscription_plan
        @customer.active_subscription.subscription_plan.should == @payable_subscription2
        @customer.subscriptions.last.subscription_plan.should == @payable_subscription1
        @customer.subscriptions.last.start_date.should == @prev_subscription.end_date + 1
        @customer.subscriptions.last.end_date.should == (@prev_subscription.end_date + 1) + 12.weeks
      end
    end

  end
end