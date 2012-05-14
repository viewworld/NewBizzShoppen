class ActiveMerchantRecurringPayment

  attr_accessor :result

  def initialize(order_number, profile_id)
    @order_number = order_number
    @profile_id = profile_id
    @gateway = ActiveMerchantGatewayWrapper.get_gateway
  end

  def make_payment(sub_period)
    @result = @gateway.purchase((sub_period.billing_price * 100).to_i, @profile_id, :order_id => @order_number)

    if @result.success?
      sub_period.update_attribute(:payment_paid_auto, true)
    else
      #save response in DB => should be also done in RecurringProfile
      #decrement failed payments count by 1
      #set date of next attempt to collect this payment if counter is not exceeded
    end
  end
end