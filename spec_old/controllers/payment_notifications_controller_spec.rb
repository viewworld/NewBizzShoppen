require 'spec_helper'

describe PaymentNotificationsController do
  include RSpec::Rails::ControllerExampleGroup
  include Devise::TestHelpers
  fixtures :all

  before(:each) do
    @customer = User::Supplier.make!
    controller.stubs(:current_user).returns(@customer)
    cart  = @customer.cart
    lead1 = Lead.make!
    lead2 = Lead.make!(:currency => lead1.currency)
    cart.add_lead(lead1)
    cart.add_lead(lead2)
  end

  context "create" do
    it "should create payment notification but not buy leads if validation fails" do
      PaymentNotification.count.should == 0
      begin
      post :create
      rescue

      end
      PaymentNotification.count.should == 0
      @customer.lead_purchases.in_cart.size.should == 2
      @customer.lead_purchases.accessible.size.should == 0
    end

    it "should create payment notification and buy leads if validation pass" do
      PaymentNotification.count.should == 0
      post :create, :txn_type => "cart", :txn_id => "irek", :payment_status => "Completed", :secret => APP_CONFIG[:paypal_secret], :receiver_email => APP_CONFIG[:paypal_email], :mc_gross => @customer.cart.total.to_s, :invoice => @customer.cart.id
      PaymentNotification.count.should == 1
      payment_notification = PaymentNotification.first
      payment_notification.status.should == "Completed"
      payment_notification.transaction_id.should == "irek"
      @customer.lead_purchases.in_cart.size.should == 0
      @customer.lead_purchases.accessible.size.should == 2
    end

  end
end