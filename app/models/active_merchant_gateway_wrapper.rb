class ActiveMerchantGatewayWrapper
  def self.get_gateway
    ActiveMerchant::Billing::QuickpayGateway.new(
                :login => APP_CONFIG[:quickpay_merchant_id],
                :password => APP_CONFIG[:quickpay_secret], :version => 4,
                :apikey => APP_CONFIG[:quickpay_api_key])
  end
end
