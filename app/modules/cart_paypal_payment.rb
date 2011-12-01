module CartPaypalPayment
  include PaypalPayment

  def hash_for_paypal(return_url, notify_url)
    values = {
        :currency_code => currency_name,
        :business   => APP_CONFIG[:paypal_email],
        :cmd        => '_cart',
        :upload     => 1,
        :return     => return_url,
        :invoice    => id,
        :notify_url => notify_url,
        :cert_id    => APP_CONFIG[:paypal_cert_id]
    }
    index = 0
    lead_purchases.each do |lp|
      index += 1
      values.merge!({
                        "amount_#{index}"      => lp.lead.price,
                        "item_name_#{index}"   => lp.header,
                        "item_number_#{index}" => lp.id,
                        "quantity_#{index}"    => lp.quantity
                    })
    end
    unless @supplier.not_charge_vat?
      values.merge!({
                        "amount_#{index+1}"      => total_vat_value,
                        "item_name_#{index+1}"   => I18n.t("cart.vat_line_title", :percentage => "#{@supplier.country_vat_rate}%"),
                        "item_number_#{index+1}" => "",
                        "quantity_#{index+1}"    => 1
                    })
    end
    values
  end

end