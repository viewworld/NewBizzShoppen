require 'spec_helper'

describe Country do
  fixtures :all

  context "destroy" do
    before(:each) do
      @country = Country.make!
    end

    it "should not be destroyed when leads are created" do
      Lead.make!(:country => @country)

      @country.reload
      @country.should_not be_can_be_destroyed
      @country.destroy.should be_false
    end

    it "should not be destroyed when deals are created" do
      Deal.make!(:country => @country)
      @country.reload
      @country.destroy.should be_false
    end

    it "should not be destroyed when addresses are created" do
      Address.make!(:country => @country)
      @country.reload
      @country.destroy.should be_false
    end

    it "should not be destroyed when vat rate is assigned" do
      VatRate.create(:rate => 25, :country => @country)

      @country.reload
      @country.destroy.should be_false
    end
  end
end