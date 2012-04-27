require 'spec_helper'

describe Deal do

  def scoped_search_setup
    @search = Deal.scoped_search
    @search.published_only = true
    @search.without_inactive = true
    @search.order("group_deal DESC, header").paginate(:page => 1, :per_page => 50)
  end

  def set_date_today_to(date)
    Date.stubs(:today).returns(date)
  end

  context "max auto buy" do
    it "should be disabled when max auto buy is reached and reactivated when 4 weeks passes" do
      @supplier = User::Supplier.make!

      @subscription_plan = SubscriptionPlan.make!(:assigned_roles => [@supplier.role.to_sym], :subscription_period => 12, :billing_cycle => 12, :big_buyer => true)
      @subscription_plan.subscription_plan_lines.make!(:price => 10)
      @supplier.upgrade_subscription!(@subscription_plan)

      @deal = Deal.make!(:max_auto_buy => 2, :use_company_name_as_category => true, :published => true, :current_user => @supplier, :email_address => @supplier.email, :end_date => Date.today + 1.year)


      @deals = scoped_search_setup
      @deals.should include @deal

      @deal.enabled_from.should == Date.today
      (0..1).each do |i|
      @lead = Lead.new(:published => true)
      @lead.based_on_deal(@deal, User::Member.make!)
      @lead.save!
      end

      @deal.reload
      @deal.enabled_from.should == Date.today+29

      @deals = scoped_search_setup

      @deals.should_not include @deal

      set_date_today_to(@deal.enabled_from)

      @deals = scoped_search_setup

      @deals.should include @deal
    end

  end

  context "destroy" do
    before(:each) do
      @deal = Deal.make!
    end

    it "should not be destroyed when unconfirmed leads exist" do
      UnconfirmedLead.make!(:deal => @deal)
      @deal.reload

      @deal.destroy.should be_false
    end

    it "should not be destroyed when leads are created" do
      @lead = Lead.new
      @lead.based_on_deal(@deal, User::Member.make!)
      @lead.save

      @deal.reload

      @deal.destroy.should be_false
    end
  end

  context "Online payment for voucher" do
    def params_for_response_from(payment_gateway, successful=true)
      if payment_gateway == :paypal
        { :txn_type => "cart", :txn_id => "irek", :payment_status => successful ? "Completed" : "Pending",
          :secret => APP_CONFIG[:paypal_secret], :receiver_email => APP_CONFIG[:paypal_email], :mc_gross => BigDecimal(@deal.brutto_discounted_price(@member).to_s).to_s,
          :invoice => "v_#{@voucher_number.deal_unique_id}_#{@voucher_number.number}_#{@voucher_number.user_id}" }
      elsif payment_gateway == :quickpay
        params = { :transaction => "irek", :qpstat => successful ? "000" : "003",
          :merchantemail => APP_CONFIG[:quickpay_email],
          :amount => "#{@deal.brutto_discounted_price(@member) * 100}",
          :ordernumber => "v_#{@voucher_number.deal_unique_id}_#{@voucher_number.number}_#{@voucher_number.user_id}",
          :msgtype => "capture", :merchant => "John Merchant"}

        params[:md5check] = ActiveMerchantVoucherPaymentNotification.new.calculate_md5_check(:capture, params)
        params
      end
    end

    before(:each) do
      @deal = Deal.make!(:deal_code => "CODE4D3AL", :voucher_enabled => true, :voucher_until_type =>1,
                         :deal_price => 2, :discounted_price => 1, :voucher_max_number => 3,
                         :voucher_how_to_redeem => "you can redeem it by calling me")
      @voucher_number = @deal.voucher_numbers.first
      @member = User::Member.make!
      @lead = (@deal.voucher_enabled? ? UnconfirmedLead : Lead).new
      @lead.based_on_deal(@deal, @member)
      @lead.save!
      @voucher_number.reserve!(@member)
      @voucher_number.reserved_until.should_not be_nil
    end

    context "Paypal" do
      it "should activate the voucher when payment is completed" do
        PaypalVoucherPaymentNotification.process(params_for_response_from(:paypal))
        @voucher_number.reload
        @voucher_number.state.should == "active"
      end

      it "should activate the voucher when payment failed" do
        PaypalVoucherPaymentNotification.process(params_for_response_from(:paypal, false))
        @voucher_number.reload
        @voucher_number.state.should_not == "active"
        @voucher_number.reserved_until.should be_nil
      end
    end

    context "Quickpay" do
      it "should activate the voucher when payment is completed" do
        ActiveMerchantVoucherPaymentNotification.process(params_for_response_from(:quickpay))
        @voucher_number.reload
        @voucher_number.state.should == "active"
      end

      it "should activate the voucher when payment failed" do
        ActiveMerchantVoucherPaymentNotification.process(params_for_response_from(:quickpay, false))
        @voucher_number.reload
        @voucher_number.state.should_not == "active"
        @voucher_number.reserved_until.should be_nil
      end
    end
  end
end