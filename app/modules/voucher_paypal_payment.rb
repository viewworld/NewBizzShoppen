module VoucherPaypalPayment
  include PaypalPayment

  def hash_for_paypal(return_url, notify_url)
    values = {
        :currency_code => deal.currency ? deal.currency.name : "",
        :business   => APP_CONFIG[:paypal_email],
        :cmd        => '_cart',
        :upload     => 1,
        :return     => return_url,
        :invoice    => "v_#{deal_unique_id}_#{number}",
        :notify_url => notify_url,
        :cert_id    => APP_CONFIG[:paypal_cert_id]
    }
      values.merge!({
                        "amount_1"      => deal.discounted_price.to_f,
                        "item_name_1"   => "voucher for deal #{deal.header}",
                        "item_number_1" => id,
                        "quantity_1"    => 1
                    })
    values
  end

end