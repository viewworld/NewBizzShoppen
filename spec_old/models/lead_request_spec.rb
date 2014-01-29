require 'spec_helper'

describe Lead do
  fixtures :all

  it "should properly filter itself" do
    lambda {
      lambda {
        3.times { LeadRequest.make! }
        2.times { LeadPurchase.make! }
      }.should change(LeadPurchase, :count).by(2)
    }.should change(LeadRequest, :count).by(3)
  end

  context "Creation and scoping" do
    it "should properly assign itself to creator" do
      customer = User::Supplier.make!
      lead_user = User::LeadUser.make!(:parent_id => customer.id)
      lead = Lead.make!
      lead_user.lead_requests.create!(:lead_id => lead.id)

      lead_user.lead_requests.should have(1).things
    end

    it "should properly be visible by owner" do
      customer = User::Supplier.make!
      lead_user = User::LeadUser.make!(:parent_id => customer.id)
      lead = Lead.make!
      lead_request = lead_user.lead_requests.create!(:lead_id => lead.id)
      customer.lead_requests.should include(lead_request)
    end
  end

  context "Processing" do
    it "should be accepted properly for regular buyer" do
      customer = User::Supplier.make!
      lead_user = User::LeadUser.make!(:parent_id => customer.id)
      lead = Lead.make!
      lead_request = lead_user.lead_requests.create!(:lead_id => lead.id)

      lambda {
        lambda {
          lead_request.accept!
        }.should change(LeadRequest, :count).by(-1)
      }.should change(LeadPurchase, :count).by(1)

      (lead_purchase = LeadPurchase.find_by_id(lead_request.id)).should_not be nil
      lead_purchase.accessible_from.should be nil
      lead_purchase.assignee_id.should be lead_user.id
    end

    it "should be accepted properly by big buyer" do
      customer = User::Supplier.make!(:subscription_plan_id => SubscriptionPlan.make!(:assigned_roles => [:supplier], :big_buyer => true))
      lead_user = User::LeadUser.make!(:parent_id => customer.id)
      lead = Lead.make!
      lead_request = lead_user.lead_requests.create!(:lead_id => lead.id)

      lead_request.accept!

      (lead_purchase =  LeadPurchase.find_by_id(lead_request.id)).should_not be nil
      lead_purchase.accessible_from.should_not be nil
    end

    it "should be rejected properly" do
      customer = User::Supplier.make!
      lead_user = User::LeadUser.make!(:parent_id => customer.id)
      lead = Lead.make!
      lead_request = lead_user.lead_requests.create!(:lead_id => lead.id)

      lambda {
        lambda {
          lead_request.reject!
        }.should change(LeadRequest, :count).by(-1)
      }.should_not change(LeadPurchase, :count)

      LeadPurchase.find_by_id(lead_request.id).should be nil
      LeadRequest.find_by_id(lead_request.id).should be nil
    end
  end


end