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



end