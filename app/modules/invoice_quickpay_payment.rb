module InvoiceQuickpayPayment
  include QuickpayPayment

  def hash_for_quickpay(continue_url, cancel_url, notify_url, language)
    voucher_values = {
        :continueurl => continue_url,
        :cancelurl => cancel_url,
        :callbackurl => notify_url,
        :ordernumber => "i_#{id}",
        :amount => (total * 100).to_i,
        :currency => currency.to_s,
        :language => language.to_s
    }
    values = base_hash_for_quickpay.merge(voucher_values)
    values.merge!(:md5check => calculate_md5_check(values, :window_request))

    values
  end
end