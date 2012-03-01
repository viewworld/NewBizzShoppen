require 'spec_helper'

describe User do
  fixtures :all

  context "Initialization and validations" do

    it "should have screen_name composed of last name and company" do
      User::Member.make!(:first_name => "Cenk", :company_name => "The Young Turks").screen_name.should == "Cenk, The Young Turks"
      User::Supplier.make!(:first_name => "Ana", :company_name => "Velvet revolver").screen_name.should == "Ana, Velvet revolver"
    end
  end

  context "unique company category" do
    it "should be created with unique company category when role is supplier" do
      @supplier = User::Supplier.make!(:company_name => "TestCompany 77")
      @supplier.company_unique_category.name.should == "TestCompany 77"
      @supplier.company_unique_category.should_not be_auto_buy
      @supplier.company_unique_category.customers.should include(User.find(@supplier.id))

      @supplier = User::CategorySupplier.make!(:company_name => "TestCompany 88")
      @supplier.company_unique_category.name.should == "TestCompany 88"
      @supplier.company_unique_category.should be_auto_buy
      @supplier.company_unique_category.customers.should include(User.find(@supplier.id))
    end

    it "should not create new category when such exists already" do
      @category = LeadCategory.for_company_name("TestCompany 88")

      @supplier = User::CategorySupplier.make!(:company_name => "TestCompany 88")
      @supplier.company_unique_category.name.should == "TestCompany 88"
      @supplier.company_unique_category.should be_auto_buy
      @supplier.company_unique_category.customers.should include(User.find(@supplier.id))
      @supplier.company_unique_category.should == @category
    end
  end

  context "category supplier auto buy enabled" do
    it "auto buy enabled should be initialized as true only for category suppliers" do
      @supplier = User::CategorySupplier.make.should be_auto_buy_enabled
      @supplier = User::CategorySupplier.make(:auto_buy_enabled => false).should_not be_auto_buy_enabled
      @supplier = User::Supplier.make.should_not be_auto_buy_enabled
      @supplier = User::Supplier.make(:auto_buy_enabled => true).should be_auto_buy_enabled
    end

    it "should make all buying categories auto buy" do
      @category1 = LeadCategory.make!
      @category2 = LeadCategory.make!

      @supplier = User::CategorySupplier.make!(:company_name => "TestCompany 88")
      @supplier.buying_categories = [@category1, @category2]
      @supplier.save
      @supplier.should be_auto_buy_enabled
      @supplier.should be_big_buyer
      @supplier.reload

      @supplier.company_unique_category.should be_auto_buy
      @supplier.buying_categories.select { |c| c.auto_buy? }.size.should == 2
      @supplier.buying_categories.select { |c| c.customer_ids.include?(@supplier.id) }.size.should == 2

      @supplier.update_attribute(:auto_buy_enabled, false)
      @supplier.reload

      @supplier.company_unique_category.should_not be_auto_buy
      @supplier.buying_categories.select { |c| !c.auto_buy? }.size.should == 2
      @supplier.buying_categories.select { |c| c.customer_ids.include?(@supplier.id) }.size.should == 2

      @supplier.update_attribute(:auto_buy_enabled, true)
      @supplier.reload

      @supplier.company_unique_category.should be_auto_buy
      @supplier.buying_categories.select { |c| c.auto_buy? }.size.should == 2
    end
  end

  context "Bought / Requested leads related methods" do

    before(:each) do
      @customer = User::Supplier.make!
      @other_customer = User::Supplier.make!
      @lead_buyer1 = User::LeadSupplier.make!(:parent_id => @customer.id)
      @lead_buyer2 = User::LeadSupplier.make!(:parent_id => @customer.id)
      @lead_buyer3 = User::Supplier.make!
      @lead_buyer3 = User::LeadSupplier.find(@lead_buyer3.id)

      @lead_user1 = User::LeadUser.make!(:parent_id => @customer.id)
      @lead_user2 = User::LeadUser.make!(:parent_id => @customer.id)
      @lead_user3 = User::LeadUser.make!(:parent_id => @other_customer.id)

      (1..5).each do |i|
        instance_variable_set("@lead#{i}", Lead.make!)
      end

      @lead_user3.lead_requests.create!(:lead_id => @lead1.id)
      @lead_buyer3.lead_purchases.create!(:lead_id => @lead1.id).tap do |purchase|
        purchase.update_attribute(:accessible_from, Time.now)
      end

    end


    context "proper ids for requested leads should be returned" do

      it "should be true if no leads have been requested" do
        @customer.all_requested_lead_ids.should have(0).things
        @lead_buyer1.all_requested_lead_ids.should have(0).things
        @lead_user1.all_requested_lead_ids.should have(0).things
        @lead_user2.all_requested_lead_ids.should have(0).things
      end

      it "should be true if one lead user has requested 2 leads" do
        @lead_user1.lead_requests.create!(:lead_id => @lead1.id)
        @lead_user1.lead_requests.create!(:lead_id => @lead2.id)

        lead_ids = [@lead1, @lead2].map(&:id)

        @customer.all_requested_lead_ids.sort.should == lead_ids                
        @lead_buyer1.all_requested_lead_ids.sort.should == lead_ids
        @lead_user1.all_requested_lead_ids.sort.should == lead_ids
        @lead_user2.all_requested_lead_ids.sort.should == lead_ids
      end

      it "should be true if two lead uses has requested total of 3 leads" do
        @lead_user1.lead_requests.create!(:lead_id => @lead1.id)
        @lead_user1.lead_requests.create!(:lead_id => @lead2.id)
        @lead_user2.lead_requests.create!(:lead_id => @lead3.id)


        lead_ids = [@lead1, @lead2, @lead3].map(&:id)

        @customer.all_requested_lead_ids.sort.should == lead_ids
        @lead_buyer1.all_requested_lead_ids.sort.should == lead_ids
        @lead_user1.all_requested_lead_ids.sort.should == lead_ids
        @lead_user2.all_requested_lead_ids.sort.should == lead_ids
      end

    end

    context "proper ids for purchased leads should be returned" do

      it "should be true if no leads have been purchased" do
        @customer.all_purchased_lead_ids.should have(0).things
        @lead_buyer1.all_purchased_lead_ids.should have(0).things
        @lead_user1.all_purchased_lead_ids.should have(0).things
        @lead_user2.all_purchased_lead_ids.should have(0).things
      end

      it "should be true if one lead buyer has purchased 2 leads" do
        lp = @lead_buyer1.lead_purchases.create!(:lead_id => @lead1.id)
        lp.update_attribute(:accessible_from, Time.now)
        lp = @lead_buyer1.lead_purchases.create!(:lead_id => @lead2.id)
        lp.update_attribute(:accessible_from, Time.now)


        lead_ids = [@lead1, @lead2].map(&:id)

        @customer.all_purchased_lead_ids.sort.should == lead_ids
        @lead_buyer1.all_purchased_lead_ids.sort.should == lead_ids
        @lead_user1.all_purchased_lead_ids.sort.should == lead_ids
        @lead_user2.all_purchased_lead_ids.sort.should == lead_ids
      end

      it "should be true if two lead users has purchased total of 3 leads" do
        lp = @lead_buyer1.lead_purchases.create!(:lead_id => @lead1.id)
        lp.update_attribute(:accessible_from, Time.now)
        lp = @lead_buyer1.lead_purchases.create!(:lead_id => @lead2.id)
        lp.update_attribute(:accessible_from, Time.now)
        lp = @lead_buyer2.lead_purchases.create!(:lead_id => @lead3.id)
        lp.update_attribute(:accessible_from, Time.now)


        lead_ids = [@lead1, @lead2, @lead3].map(&:id)

        @customer.all_purchased_lead_ids.sort.should == lead_ids
        @lead_buyer1.all_purchased_lead_ids.sort.should == lead_ids
        @lead_user1.all_purchased_lead_ids.sort.should == lead_ids
        @lead_user2.all_purchased_lead_ids.sort.should == lead_ids
      end

      it "should be true if two lead users and customer has purchased total of 3 leads" do
        lp = @lead_buyer1.lead_purchases.create!(:lead_id => @lead1.id)
        lp.update_attribute(:accessible_from, Time.now)
        lp = @lead_buyer2.lead_purchases.create!(:lead_id => @lead2.id)
        lp.update_attribute(:accessible_from, Time.now)
        lp = @customer.lead_purchases.create!(:lead_id => @lead3.id)
        lp.update_attribute(:accessible_from, Time.now)


        lead_ids = [@lead1, @lead2, @lead3].map(&:id)

        @customer.all_purchased_lead_ids.sort.should == lead_ids
        @lead_buyer1.all_purchased_lead_ids.sort.should == lead_ids
        @lead_user1.all_purchased_lead_ids.sort.should == lead_ids
        @lead_user2.all_purchased_lead_ids.sort.should == lead_ids
      end
    end

  end

  context "update" do

    context "vat number changes" do
      it "should update vat number in CompanyVat when van number changed" do
        @payable_subscription1 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :subscription_period => 12, :can_be_upgraded => false, :free_period => 2)
        @payable_subscription1.subscription_plan_lines.make!(:price => 25)

        @customer = User::Supplier.make!(:subscription_plan_id => @payable_subscription1.id, :vat_number => "VAT111111111111")
        @customer.has_free_period_available?.should be_false

        @customer.update_attributes(:vat_number => "VAT22222222222")
        @customer.has_free_period_available?.should be_false
      end
    end
  end

  context "destroy" do
    context "subscriber" do
      it "should not be destroyed when there is active payable subscription" do
        @payable_subscription1 = SubscriptionPlan.make!(:assigned_roles => [:supplier], :subscription_period => 12, :billing_cycle => 3, :can_be_upgraded => false)
        @payable_subscription1.subscription_plan_lines.make!(:price => 25)
        @payable_subscription1.subscription_plan_lines.make!(:price => 5)
        @supplier = User::Supplier.make!(:subscription_plan_id => @payable_subscription1.id)
        @supplier.destroy.should be_false
      end
    end

    context "supplier" do
      before(:each) do
        @supplier = User::Supplier.make!
      end

      it "should not be destroyed when there are lead purchases" do
        LeadPurchase.make!(:owner_id => @supplier.id)
        @supplier.reload
        @supplier.destroy.should be_false
      end

      it "should not be destroyed when there are deals" do
        Deal.make!(:email_address => @supplier.email)
        @supplier.reload
        @supplier.destroy.should be_false
      end

      it "should not be destroyed when there are leads in cart" do
        @supplier.cart.add_lead(Lead.make!)
        @supplier.destroy.should be_false
      end

      it "should not be destroyed when there are subaccounts" do
        User::LeadSupplier.make!(:parent_id => @supplier.id)
        @supplier.reload
        @supplier.destroy.should be_false
      end

      it "should not be destroyed when there are invoices" do
        Invoice.make!(:user => @supplier)
        @supplier.reload
        @supplier.destroy.should be_false
      end
    end

    context "category supplier" do
      before(:each) do
        @category_supplier = User::CategorySupplier.make!
      end

      it "should not be destroyed when there are lead purchases" do
        LeadPurchase.make!(:owner_id => @category_supplier.id)
        @category_supplier.reload
        @category_supplier.destroy.should be_false
      end

      it "should not be destroyed when there are deals" do
        Deal.make!(:email_address => @category_supplier.email)
        @category_supplier.reload
        @category_supplier.destroy.should be_false
      end

      it "should not be destroyed when there are leads in cart" do
        @category_supplier.cart.add_lead(Lead.make!)
        @category_supplier.destroy.should be_false
      end

      it "should not be destroyed when there are subaccounts" do
        User::LeadSupplier.make!(:parent_id => @category_supplier.id)
        @category_supplier.reload
        @category_supplier.destroy.should be_false
      end

      it "should not be destroyed when there are invoices" do
        Invoice.make!(:user => @category_supplier)
        @category_supplier.reload
        @category_supplier.destroy.should be_false
      end
    end

    context "lead buyer" do
      before(:each) do
        @supplier = User::Supplier.make!
        @lead_buyer = User::LeadSupplier.make!(:parent_id => @supplier.id)
      end

      it "should not be destroyed when there are leads" do
        @lead_buyer.cart.add_lead(Lead.make!)
        @lead_buyer.destroy.should be_false
      end

      it "should not be destroyed when there are assigned leads" do
        LeadPurchase.make!(:owner_id => @supplier.id, :assignee_id => @lead_buyer.id, :accessible_from => Time.now)
        @lead_buyer.reload
        @lead_buyer.destroy.should be_false
      end
      end

    context "lead user" do
      before(:each) do
        @supplier = User::Supplier.make!
        @lead_user = User::LeadUser.make!(:parent_id => @supplier.id)
      end

      it "should not be destroyed when there are lead requests" do
        LeadRequest.make!(:requested_by => @lead_user)
        @lead_user.reload
        @lead_user.destroy.should be_false
      end

      it "should not be destroyed when there are assigned leads" do
        LeadPurchase.make!(:owner_id => @supplier.id, :assignee_id => @lead_user.id, :accessible_from => Time.now)
        @lead_user.reload
        @lead_user.destroy.should be_false
      end
    end

    context "agent" do
      before(:each) do
        @agent = User::Agent.make!
      end

      it "should not be destroyed when there are leads created" do
        Lead.make!(:creator => @agent)
        @agent.reload
        @agent.destroy.should be_false
      end

      it "should not be destroyed when there are deals created" do
        Deal.make!(:creator => @agent)
        @agent.reload
        @agent.destroy.should be_false
      end

      context "campaigns"  do

        before(:each) do
          @campaign = Campaign.make!
        end

        it "should not be destroyed when there are contacts assigned" do
          Contact.make!(:agent_id => @agent)
          @agent.reload
          @agent.destroy.should be_false
        end

        it "should not be destroyed when there are call results created" do
          CallResult.make!(:creator => @agent)
          @agent.reload
          @agent.destroy.should be_false
        end
      end
    end

    context "call centre agent" do
      before(:each) do
        @call_centre_agent = User::CallCentreAgent.make!
      end

      it "should not be destroyed when there are leads created" do
        l = Lead.make!(:current_user => @call_centre_agent)
        l.creator = @call_centre_agent
        l.save
        @call_centre_agent.reload
        @call_centre_agent.destroy.should be_false
      end

      it "should not be destroyed when there are deals created" do
        d = Deal.make!(:current_user => @call_centre_agent)
        d.creator = @call_centre_agent
        d.save
        @call_centre_agent.reload
        @call_centre_agent.destroy.should be_false
      end

      context "campaigns"  do

        before(:each) do
          @campaign = Campaign.make!
        end

        it "should not be destroyed when there are contacts assigned" do
          Contact.make!(:agent_id => @call_centre_agent)
          @call_centre_agent.reload
          @call_centre_agent.destroy.should be_false
        end

        it "should not be destroyed when there are call results created" do
          CallResult.make!(:creator => @call_centre_agent)
          @call_centre_agent.reload
          @call_centre_agent.destroy.should be_false
        end
      end
    end
    context "call centre" do
      before(:each) do
        @call_centre = User::CallCentre.make!
      end

      it "should not be destroyed when there are deals created" do
        d = Deal.make!(:current_user => @call_centre)
        d.creator = @call_centre
        d.save
        @call_centre.reload
        @call_centre.destroy.should be_false
      end

      it "should not be destroyed when there are agents created" do
        User::CallCentreAgent.make!(:parent_id => @call_centre.id)
        @call_centre.reload
        @call_centre.destroy.should be_false
      end

      context "campaigns"  do
        before(:each) do
          @campaign = Campaign.make!
        end

        it "should not be destroyed when there are contacts assigned" do
          Contact.make!(:agent_id => @call_centre)
          @call_centre.reload
          @call_centre.destroy.should be_false
        end

        it "should not be destroyed when there are call results created" do
          CallResult.make!(:creator => @call_centre)
          @call_centre.reload
          @call_centre.destroy.should be_false
        end
      end
    end

    context "member" do
      before(:each) do
        @member = User::Member.make!
      end

      it "should not be destroyed when there are requested deals" do
        @deal = Deal.make!
        @lead = Lead.new
        @lead.based_on_deal(@deal, @member)
        @lead.save

        @member.destroy.should be_false
      end

      it "should not be destroyed when there are leads created (tenders)" do
        l = Lead.make!(:current_user => @member)
        l.creator = @member
        l.save
        @member.reload
        @member.destroy.should be_false
      end
    end

    context "admin" do
      before(:each) do
        @admin = User::Admin.make!
      end

      it "should not be destroyed when there are deals created" do
        d = Deal.make!(:current_user => @admin)
        d.creator = @admin
        d.save
        @admin.reload
        @admin.destroy.should be_false
      end
    end
  end
end

