require 'spec_helper'

describe Cart do
  fixtures :all

  before(:each) do
    @buyer = User::Supplier.make!
    @buyer.address.country.vat_rate.update_attribute(:rate, 50.0)
    @buyer = User::LeadSupplier.find(@buyer.id)
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

    it "should not contain requested leads" do
      @lead      = Lead.make!
      @customer  = User::Supplier.make!
      @lead_user = User::LeadUser.make!(:parent_id => @customer.id)
      @lead_user.lead_requests.create!(:lead_id => @lead.id)

      cart = Cart.new(User::LeadSupplier.find(@customer.id))

      cart.empty?.should be true
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

    it "should add multiple leads to cart properly" do
      lead1 = Lead.make!
      lead2 = Lead.make!(:currency => lead1.currency)
      cart  = Cart.new(@buyer)
      lambda { cart.add_leads(lead1.id, lead2.id) }.should change(cart, :empty?).from(true).to(false)
      cart.items.should have(2).things
    end

    it "should calculate the total properly" do
      lead1 = Lead.make!(:price => 100.0)
      lead2 = Lead.make!(:price => 150.0, :currency => lead1.currency)

      cart  = Cart.new(@buyer)

      cart.add_lead(lead1)
      cart.add_lead(lead2)

      cart.empty?.should be false
      cart.items.should have(2).things
      cart.total.to_f.should == 375.0
    end


  end

  context "Removing leads from cart" do

    it "should be emptied properly" do
      cart = Cart.new(@buyer)
      currency = Currency.make!
      cart.add_lead(Lead.make!(:currency => currency))
      cart.add_lead(Lead.make!(:currency => currency))
      lambda { cart.empty! }.should change(cart, :count).from(2).to(0)
    end

    it "should remove specific item from cart properly" do
      currency = Currency.make!
      lead1 = Lead.make!(:currency => currency)
      lead2 = Lead.make!(:currency => currency)
      lead3 = Lead.make!(:currency => currency)

      cart  = Cart.new(@buyer)

      cart.add_lead(lead1)
      cart.add_lead(lead2)
      cart.add_lead(lead3)

      lambda { cart.remove_leads(lead1.id, lead2.id) }.should change(cart, :count).from(3).to(1)

      cart.items.should_not include(lead1)
      cart.items.should_not include(lead2)
      cart.items.should include(lead3)
    end

  end

  context "Paid for lead in the card" do

    it "should decrease lead purchases in cart and increase accessible lead purchases " do
      currency = Currency.make!
      lead1 = Lead.make!(:currency => currency)
      lead2 = Lead.make!(:currency => currency)

      cart  = Cart.new(@buyer)

      cart.add_lead(lead1)
      cart.add_lead(lead2)
      lambda {
        lambda { cart.paid! }.should change(@buyer.lead_purchases.in_cart, :count).by(-2)
      }.should change(@buyer.lead_purchases.accessible, :count).by(2)
    end
  end

end