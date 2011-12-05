require "paypal/recurring"

PayPal::Recurring.configure do |config|
  config.sandbox = true
  config.username = APP_CONFIG[:paypal_api_email]
  config.password = APP_CONFIG[:paypal_api_password]
  config.signature = APP_CONFIG[:paypal_api_key]
end

#p = PaypalNVP.new(true, { :user => APP_CONFIG[:paypal_api_email], :pass => APP_CONFIG[:paypal_api_password], :cert => APP_CONFIG[:paypal_api_key], :url => APP_CONFIG[:paypal_api_url] })
#data = {
#  :method => "GetRecurringPaymentsProfileDetails",
#  :profileid => "I-91VAF2330GT5"
#}
#p.call_paypal(data)
#puts result["ACK"] # Success