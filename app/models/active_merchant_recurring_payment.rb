class ActiveMerchantRecurringPayment

  attr_accessor :result

  def initialize(subperiod)
    @subperiod = subperiod
    @gateway = ActiveMerchantGatewayWrapper.get_gateway
  end

  def make_payment!
    return true if @subperiod.payment_paid?
    @result = @gateway.purchase((@subperiod.billing_price * 100).to_i, @subperiod.subscription.payment_profile_id, :order_id => "ssp#{@subperiod.id}")

    if @result.success?
      @subperiod.update_attributes(:payment_paid_auto => true, :payment_retry_at => nil)
      if @subperiod.subscription.subscription_sub_periods.last == @subperiod and
          @subperiod.subscription.subscription_sub_periods.where("payment_paid_auto is false and payment_paid_manual is false").empty?
        ActiveMerchantRecurringProfile.new(@subperiod.subscription.payment_profile_id).cancel_profile
      end
    else
      subscription = @subperiod.subscription
      subscription.update_attribute(:payment_retries_counter, subscription.payment_retries_counter.to_i + 1)

      ArchivedActiveMerchantResponse.create(:subscription => subscription, :user => subscription.user, :has_errors => true,
                                            :response_type => "purchase", :response_details => "Payment for subperiod #{@subperiod.id} failed: \n #{@result.message}")
      if subscription.payment_retries_counter < subscription.payment_retries
        @subperiod.update_attribute(:payment_retry_at, Date.today + 2)
      end
    end
  end
end