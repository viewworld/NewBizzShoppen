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
      subscription = Subscription.where(:payment_profile_id => @profile_id).first
      ArchivedActiveMerchantResponse.create(:subscription => subscription, :subscription_type => subscription.class.to_s,
                                            :user_id => subscription ? subscription.user : nil, :response_type => "void", :has_errors => true,
                                            :response_details => "Cancel profile #{@profile_id} failed with error: \n #{result.message}")
      #EmailNotification.notify("ActiveMerchantRecurringProfile error", "<p>Profile ID: #{@profile_id}<br /> Response:<br />#{result.message}</p>")
    end
  end
end