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

      values.merge!({
                        "amount_1"      => total,
                        "item_name_1"   => I18n.t("models.invoice.invoice_paypal_name", :number => full_number),
                        "item_number_1" => id,
                        "quantity_1"    => 1
                    })

    values
  end

end