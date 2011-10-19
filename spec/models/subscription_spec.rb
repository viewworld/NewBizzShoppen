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


  context "user should have to be able to apply payable subscription when created or updated" do
    before(:each) do
      @subscription_plan = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12)
      @subscription_plan_2 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 10)
      @customer = User::Supplier.make!(:subscription_plan_id => @subscription_plan.id)
    end

    it "should have assigned a proper subscription after creation" do
      @customer.active_subscription.subscription_plan.should == @subscription_plan
    end

    it "should have assigned the same subscription after update without any plan param" do
      @customer.update_attributes(:screen_name => "Ted3949de938d")
      @customer.active_subscription.subscription_plan.should == @subscription_plan
    end

    it "should have assigned specified subscription after update" do
      @customer.update_attributes!(:subscription_plan_id => @subscription_plan_2.id)
      @customer.active_subscription.subscription_plan.should == @subscription_plan_2
    end
  end

  context "user should have to be able to apply free subscription when created or updated" do
    before(:each) do
      @customer = User::Supplier.make!
    end

    it "should have assigned free subscription when specified during creation" do
      @customer.active_subscription.subscription_plan.should == SubscriptionPlan.active.free.for_role("supplier").first
    end

    it "should have assigned free subscription when specified during update" do
      @subscription_plan = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12)
      @customer.update_attributes(:subscription_plan_id => @subscription_plan.id)
      @customer.active_subscription.subscription_plan.should == @subscription_plan
      @customer.update_attributes(:assign_free_subscription_plan => true)
      @customer.active_subscription.subscription_plan.should == SubscriptionPlan.active.free.for_role("supplier").first
    end
  end

  context "user should not be able to assign incorrect subscription" do
    it "should not be able to apply member's subscription to supplier" do
      @member_subscription = SubscriptionPlan.make!(:assigned_roles => [:member], :billing_cycle => 12)
      @supplier_subscription = SubscriptionPlan.make!(:assigned_roles => [:supplier], :billing_cycle => 12)
      @customer = User::Supplier.make(:subscription_plan_id => @member_subscription.id, :assign_free_subscription_plan => false)
      @customer.save
      @customer.should_not be_valid
      @customer.should have(1).error_on(:subscription_plan_id)
    end

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