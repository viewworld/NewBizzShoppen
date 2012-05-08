module CartQuickpayPayment
  include QuickpayPayment

  def hash_for_quickpay(continue_url, cancel_url, notify_url, language)
    cart_values = {
        :continueurl => continue_url,
        :cancelurl => cancel_url,
        :callbackurl => notify_url,
        :ordernumber => id,
        :amount => total_in_cents,
        :currency => currency.to_s,
        :language => language.to_s
    }
    values = base_hash_for_quickpay.merge(cart_values)
    values.merge!(:md5check => calculate_md5_check(values[:msgtype], values))

    values
  end
end