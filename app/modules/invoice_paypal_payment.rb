module InvoicePaypalPayment
  include PaypalPayment

  def hash_for_paypal(return_url, notify_url)
    values = {
        :currency_code => currency,
        :business   => APP_CONFIG[:paypal_email],
        :cmd        => '_cart',
        :upload     => 1,
        :return     => return_url,
        :invoice    => "i_#{id}",
        :notify_url => notify_url,
        :cert_id    => APP_CONFIG[:paypal_cert_id]
    }

    index = 0
    invoice_lines.each do |line|
      index += 1
      values.merge!({
                        "amount_#{index}"      => line.netto_price,
                        "item_name_#{index}"   => line.name,
                        "item_number_#{index}" => line.id,
                        "quantity_#{index}"    => line.quantity
                    })
    end

    unless user.not_charge_vat?
      values.merge!({
                        "amount_#{index+1}"      => total_vat,
                        "item_name_#{index+1}"   => I18n.t("cart.vat_line_title", :percentage => "#{user.country_vat_rate}%"),
                        "item_number_#{index+1}" => "",
                        "quantity_#{index+1}"    => 1
                    })
    end
    values
  end

end