class ActiveMerchantRecurringProfile

  attr_accessor :result

  def initialize(profile_id)
    @gateway = ActiveMerchantGatewayWrapper.get_gateway
    @profile_id = profile_id
  end

  def cancel_profile
    result = @gateway.void(@profile_id)
    if result.success?
      true
    else
      EmailNotification.notify("ActiveMerchantRecurringProfile error", "<p>Profile ID: #{@profile_id}<br /> Response:<br />#{result.message}</p>")
    end
  end
end