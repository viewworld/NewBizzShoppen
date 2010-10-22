require 'spec_helper'

describe Cart do
  fixtures :all

  before(:each) do
    @buyer = User::LeadBuyer.make!
  end

  context "Initialization" do
    it "should initialize properly" do
      cart = Cart.new(@buyer)
      cart.should be_a_kind_of Cart
    end

    it "should return 0.0 as total if empty" do
      cart = Cart.new(@buyer)

      cart.empty?.should be true
      cart.total.should == 0.0
    end
  end

  context "Adding leads to cart" do
    it "should add new lead to cart properly" do
      lead = Lead.make!
      cart = Cart.new(@buyer)

      cart.add_lead(lead).should_not be false

      cart.empty?.should be false
      cart.items.should have(1).things
    end

    it "should calculate the total properly" do
      lead1 = Lead.make!(:price => 100.0)
      lead2 = Lead.make!(:price => 150.0)

      cart = Cart.new(@buyer)

      cart.add_lead(lead1)
      cart.add_lead(lead2)

      cart.empty?.should be false
      cart.items.should have(2).things
      cart.total.should == 250.0
    end
  end

  context "Removing leads from cart" do

    it "should be emptied properly" do
      cart = Cart.new(@buyer)
      cart.add_lead(Lead.make!)
      cart.add_lead(Lead.make!)
      lambda { cart.empty! }.should change(cart, :count).from(2).to(0)
    end

    it "should remove specific item from cart properly" do
      lead1 = Lead.make!
      lead2 = Lead.make!
      lead3 = Lead.make!

      cart = Cart.new(@buyer)

      cart.add_lead(lead1)
      cart.add_lead(lead2)
      cart.add_lead(lead3)

      lambda { cart.remove_lead(lead1.id, lead2.id) }.should change(cart, :count).from(3).to(1)

      cart.items.should_not include(lead1)
      cart.items.should_not include(lead2)
      cart.items.should include(lead3)
    end

  end
end