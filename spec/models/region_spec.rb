require 'spec_helper'

describe Region do
  fixtures :all

  context "destroy" do
    before(:each) do
      @region = Region.make!
    end

    it "should not be destroyed when leads are created" do
      Lead.make!(:region => @region)

      @region.reload
      @region.destroy.should be_false
    end

    it "should not be destroyed when deals are created" do
      Deal.make!(:region => @region)
      @region.reload
      @region.destroy.should be_false
    end

    it "should not be destroyed when addresses are created" do
      Address.make!(:region => @region)
      @region.reload
      @region.destroy.should be_false
    end
  end
end