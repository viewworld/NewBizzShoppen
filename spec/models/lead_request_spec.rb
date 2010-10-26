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
      lead_user = User::LeadUser.make!
      lead = Lead.make!
      lead_user.lead_requests.create!(:lead_id => lead.id)

      lead_user.lead_requests.should have(1).things
    end

    it "should propely be visible by owner" do
     customer = User::Customer.make!
      lead_user = User::LeadUser.make!(:parent_id => customer.id)
      lead = Lead.make!
      lead_request = lead_user.lead_requests.create!(:lead_id => lead.id)
      customer.lead_requests.should include(lead_request)
    end


  end


end