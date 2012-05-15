class ActiveMerchantGatewayWrapper
  def self.get_gateway
    if Rails.env.test?
      ActiveMerchant::Billing::BogusGateway.new
    else
      ActiveMerchant::Billing::QuickpayGateway.new(
                :login => APP_CONFIG[:quickpay_merchant_id],
                :password => APP_CONFIG[:quickpay_secret], :version => 4,
                :apikey => APP_CONFIG[:quickpay_api_key])
    end
  end
end
