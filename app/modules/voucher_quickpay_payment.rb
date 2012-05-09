module VoucherQuickpayPayment
  include QuickpayPayment

  def hash_for_quickpay(continue_url, cancel_url, notify_url, language)
    voucher_values = {
        :continueurl => continue_url,
        :cancelurl => cancel_url,
        :callbackurl => notify_url,
        :ordernumber => "v_#{deal_unique_id}_#{number}_#{user_id}",
        :amount => (deal.brutto_discounted_price(user) * 100).to_i,
        :currency => deal.currency.to_s,
        :language => language.to_s
    }
    values = base_hash_for_quickpay.merge(voucher_values)
    values.merge!(:md5check => calculate_md5_check(values, :window_request))

    values
  end
end