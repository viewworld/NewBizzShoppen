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
                                            :response_details => "Cancel profile #{@profile_id} failed with error: \n #{result.message} \n Params: #{result.params.select { |k,v| !v.blank? and k != "qpstatmsg" }.map { |p| p.join(": ") }.join(", \n")}")
    end
    result
  end
end