require 'spec_helper'

describe Deal do

  def scoped_search_setup
    @search = Deal.scoped_search
    @search.published_only = true
    @search.without_inactive = true
    @search.order("group_deal DESC, header").paginate(:page => 1, :per_page => 50)
  end

  def set_date_today_to(date)
    Date.stubs(:today).returns(date)
  end

  context "max auto buy" do
    it "should be disabled when max auto buy is reached and reactivated when 4 weeks passes" do
      @supplier = User::Supplier.make!

      @subscription_plan = SubscriptionPlan.make!(:assigned_roles => [@supplier.role.to_sym], :billing_cycle => 12, :big_buyer => true)
      @subscription_plan.subscription_plan_lines.make!(:price => 10)
      @supplier.upgrade_subscription!(@subscription_plan)

      @deal = Deal.make!(:max_auto_buy => 2, :use_company_name_as_category => true, :published => true, :current_user => @supplier, :email_address => @supplier.email, :end_date => Date.today + 1.year)


      @deals = scoped_search_setup
      @deals.should include @deal

      @deal.enabled_from.should == Date.today
      (0..1).each do |i|
      @lead = Lead.new(:published => true)
      @lead.based_on_deal(@deal, User::Member.make!)
      @lead.save!
      end

      @deal.reload
      @deal.enabled_from.should == Date.today+29

      @deals = scoped_search_setup

      @deals.should_not include @deal

      set_date_today_to(@deal.enabled_from)

      @deals = scoped_search_setup

      @deals.should include @deal
    end

  end
end