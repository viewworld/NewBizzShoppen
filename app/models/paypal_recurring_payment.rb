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
    archive_response!("checkout")
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
    archive_response!("request_payment")
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
    archive_response!("create_recurring_profile")
  end

  def profile_id
    @response.profile_id
  end

  def response_errors
    @response.errors.map { |i| "#{i[:code]}: #{i[:messages]}" }.join("<br />")
  end

  def detailed_response_errors
    "#{@response.to_yaml}\n#{@response.errors.map { |i| "#{i[:code]}: #{i[:messages]}" }.join('\n')}"
  end

  def archive_response!(response_type)
    apr = ArchivedPaypalResponse.create(:user => @options[:user], :response_type => response_type,
                                  :response_details => detailed_response_errors,
                                  :subscription => @options[:subscription_plan],
                                  :has_errors => response_has_errors?, :response_type => response_type)
    notify_about_errors(apr)
  end

  def response_has_errors?
    (@response.respond_to?(:valid?) and !@response.valid?) or !@response.errors.empty?
  end

  def notify_about_errors(archived_response)
    if archived_response.has_errors?
      TemplateMailer.delay.new("tomasz.noworyta@gmail.com,aossowski@gmail.com", :blank_template, Country.get_country_from_locale,
                              {:subject_content => "Paypal recurring payment error has occurred",
                               :body_content => "<p>ArchivedPaypalResponse: ##{archived_response.id}</p><p>Time: #{Time.now.strftime("%d-%m-%Y %H:%M")}</p><br /><b>Backtrace:</b><p>#{detailed_response_errors.gsub("\n", "<br />")}</p>"})
    end
  end
end