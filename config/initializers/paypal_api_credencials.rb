require "paypal/recurring"

PayPal::Recurring.configure do |config|
  config.sandbox = true
  config.username = "seller_1292244681_biz_api1.gmail.com"
  config.password = "1292244690"
  config.signature = "AUVjzPkoCJAf1p9N6vEssI4hIPVVA6XjBKUpjBLNogHCfw29dQWFK6bF"
end

#p = PaypalNVP.new(true, { :user => "seller_1292244681_biz_api1.gmail.com", :pass => "1292244690", :cert => "AUVjzPkoCJAf1p9N6vEssI4hIPVVA6XjBKUpjBLNogHCfw29dQWFK6bF", :url => "https://api-3t.sandbox.paypal.com/nvp" })
#data = {
#  :method => "GetRecurringPaymentsProfileDetails",
#  :profileid => "I-91VAF2330GT5"
#}
#p.call_paypal(data)
#puts result["ACK"] # Success