class PaypalRecurringPayment

  attr_accessor :response

  def initialize(options={})
    @options = options
    @response = nil
  end

  def checkout?
    @response = PayPal::Recurring.new({
      :return_url   => @options[:return_url],
      :cancel_url   => @options[:cancel_url],
      :ipn_url      => @options[:ipn_url],
      :description  => @options[:subscription_plan].name,
      :amount       => @options[:subscription_plan].billing_price,
      :currency     => @options[:subscription_plan].currency.to_s
    }).checkout
    @response.valid?
  end

  def checkout_url
    @response.checkout_url
  end

  def request_payment?
    @response = PayPal::Recurring.new({
      :token       => @options[:token],
      :payer_id    => @options[:payer_id],
      :amount      => @options[:subscription_plan].total_billing_for_subperiod,
      :currency    => @options[:subscription_plan].currency.to_s,
      :description => @options[:subscription_plan].name,
      :ipn_url      => @options[:ipn_url],
      :failed => 1
    }).request_payment
    @response.approved? and @response.completed?
  end

  def create_profile
    @response = PayPal::Recurring.new({
      :amount      => @options[:subscription_plan].total_billing_for_subperiod,
      :currency    => @options[:subscription_plan].currency.to_s,
      :description => @options[:subscription_plan].name,
      :ipn_url     => @options[:ipn_url],
      :frequency   => @options[:subscription_plan].billing_cycle,
      :token       => @options[:token],
      :period      => :daily,
      :reference   => @options[:user].active_subscription.id.to_s,
      :payer_id    => @options[:payer_id],
      :start_at    => @options[:start_at] || Time.now.utc,
      :total_billing_cycles   => @options[:subscription_plan].subscription_sub_periods.size,
      :failed      => 1,
      :outstanding => :next_billing,
      :failed => 1
    }).create_recurring_profile
  end

  def profile_id
    @response.profile_id
  end

  def response_errors
    @response.errors.map { |i| "#{i[:code]}: #{i[:messages]}" }.join("<br />")
  end

  def archive_response!(response_type)
    ArchivedPaypalResponse.create(:user => @options[:user], :response_type => response_type,  :response_details => @response.inspect, :subscription => @options[:subscription_plan],
                                  :has_errors => false)
  end
end