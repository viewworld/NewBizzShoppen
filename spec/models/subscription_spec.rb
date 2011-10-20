require 'spec_helper'

describe Subscription do
  fixtures :all

  context "pricing" do
    it "should yield correct billing price" do
      @payable_subscription1 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12, :can_be_upgraded => false)
      @payable_subscription1.subscription_plan_lines.make!(:price => 25)
      @payable_subscription1.subscription_plan_lines.make!(:price => 5)

      @payable_subscription1.total_billing.should.eql?(30)
      @customer = User::Supplier.make!(:subscription_plan_id => @payable_subscription1.id)
      @customer.active_subscription.total_billing.should.eql?(30)
    end

    context "free period" do

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

  context "subscription changes: upgrade, downgrade and cancellation" do

    def setup_customer(subscription_plan)
      @customer = User::Supplier.make!(:subscription_plan_id => subscription_plan.id)
      @customer.active_subscription.subscription_plan.should == subscription_plan
      @prev_subscription = @customer.active_subscription
    end

    context "upgrade" do
      before(:each) do
        @payable_subscription1 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12)
        @payable_subscription1.subscription_plan_lines.make!(:price => 25)
        @payable_subscription2 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12)
        @payable_subscription2.subscription_plan_lines.make!(:price => 100)
      end

      it "should be upgraded if new one is more expensive" do
        setup_customer(@payable_subscription1)
        @customer.active_subscription.should be_normal
        @customer.change_subscription!(@payable_subscription2)
        @prev_subscription.reload
        @prev_subscription.should be_upgraded
        @customer.active_subscription.subscription_plan.should == @payable_subscription2
      end

      it "should NOT be upgraded if new one is invalid" do
        @payable_subscription2.update_attribute(:assigned_roles, [:member])
        setup_customer(@payable_subscription1)
        @customer.active_subscription.should be_normal
        @customer.change_subscription!(@payable_subscription2)
        @prev_subscription.reload
        @prev_subscription.should be_normal
        @customer.active_subscription.subscription_plan.should == @payable_subscription1
      end

      it "should be downgraded if new one is less expensive" do
        setup_customer(@payable_subscription2)
        @customer.active_subscription.should be_normal
        @customer.change_subscription!(@payable_subscription1)
        @prev_subscription.reload
        @prev_subscription.should be_downgraded
        @customer.active_subscription.subscription_plan.should == @payable_subscription2
        @customer.subscriptions.last.should == @payable_subscription1
      end

      it "should NOT be downgraded if new one is invalid" do
        @payable_subscription1.update_attribute(:assigned_roles, [:member])
        setup_customer(@payable_subscription2)
        @customer.active_subscription.should be_normal
        @customer.change_subscription!(@payable_subscription1)
        @prev_subscription.reload
        @prev_subscription.should be_normal
        @customer.active_subscription.subscription_plan.should == @payable_subscription2
      end
    end
  end

  #----------------------------------------------------------------------------------------------------------

  context "user should not be able to assign incorrect subscription" do
    context "downgrade & upgrade limitations" do
      before(:each) do
        @payable_subscription1 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12, :can_be_upgraded => false)
        @payable_subscription1.subscription_plan_lines.make!(:price => 25)
        @payable_subscription2 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12, :can_be_downgraded => false)
        @payable_subscription2.subscription_plan_lines.make!(:price => 120)
      end

      it "should not be possible to downgrade if current subscription doesn't allow that" do
        @customer = User::Supplier.make!(:subscription_plan_id => @payable_subscription2.id)
        @customer.update_attributes(:subscription_plan_id => @payable_subscription1.id)
        @customer.should have(1).error_on(:subscription_plan_id)
      end

      it "should not be possible to upgrade if current subscription doesn't allow that" do
        @customer = User::Supplier.make!(:subscription_plan_id => @payable_subscription1.id)
        @customer.update_attributes(:subscription_plan_id => @payable_subscription2.id)
        @customer.should have(1).error_on(:subscription_plan_id)
      end
    end
  end

  context "user should be able to cancel the subscription" do
    it "should be possible to cancel payable subscription and then switch to free one before lockup period" do
      @subscription = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12)
      @customer = User::Supplier.make!(:subscription_plan_id => @subscription.id)
      @customer.active_subscription.should be_payable
      @customer.active_subscription.cancel!
      @customer.active_subscription.should be_present
      @customer.active_subscription.should_not be_payable
    end

    it "should be possible to cancel payable subscription and then switch to free one within lockup period" do
      #adds another subscr with the same length
    end

    it "should not be possible to cancel free subscription" do
      @customer = User::Supplier.make!
      @customer.active_subscription.should_not be_payable
      @customer.active_subscription.cancel!
      @customer.active_subscription.should_not be_payable
    end
  end
end