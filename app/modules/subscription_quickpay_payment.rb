module SubscriptionQuickpayPayment
  include QuickpayPayment

  def hash_for_quickpay(continue_url, cancel_url, notify_url, language, subscription_ordernumber=nil)
    subscription_values = {
        :msgtype => "subscribe",
        :continueurl => continue_url,
        :cancelurl => cancel_url,
        :callbackurl => notify_url,
        :ordernumber => "s#{Time.now.strftime("%y%m%d%S")}_#{subscription_ordernumber ? subscription_ordernumber.id : id}",
        :amount => (total_billing * 100).to_i,
        :currency => currency.to_s,
        :language => language.to_s,
        :description => "#{name.first(20)}"
    }
    values = base_hash_for_quickpay.merge(subscription_values)
    values.delete(:autocapture)
    values.merge!(:md5check => calculate_md5_check(values, :window_request))
    values
  end
end