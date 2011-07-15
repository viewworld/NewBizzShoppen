require 'spec_helper'

describe User do
  fixtures :all


  context "Bought / Requested leads related methods" do

    before(:each) do
      @customer = User::Customer.make!
      @lead_buyer1 = User::LeadBuyer.make!(:parent_id => @customer.id)
      @lead_buyer2 = User::LeadBuyer.make!(:parent_id => @customer.id)
      @lead_buyer3 = User::Customer.make!
      @lead_buyer3 = User::LeadBuyer.find(@lead_buyer3.id)

      @lead_user1 = User::LeadUser.make!(:parent_id => @customer.id)
      @lead_user2 = User::LeadUser.make!(:parent_id => @customer.id)
      @lead_user3 = User::LeadUser.make!

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


end

