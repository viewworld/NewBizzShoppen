module PaypalPayment

  PAYPAL_CERT_PEM = File.read("#{Rails.root}/certs/#{Rails.env == 'production' ? 'production' : 'staging'}/paypal_cert.pem")
  APP_CERT_PEM    = File.read("#{Rails.root}/certs/#{Rails.env == 'production' ? 'production' : 'staging'}/app_cert.pem")
  APP_KEY_PEM     = File.read("#{Rails.root}/certs/#{Rails.env == 'production' ? 'production' : 'staging'}/app_key.pem")

  def encrypt_for_paypal(values)
    signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
    OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
  end

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

  def encrypt_subscription
    encrypt_for_paypal({
        :currency_code => currency.to_s,
        :business      => APP_CONFIG[:paypal_email],
        :cmd           => '_xclick-subscriptions',
        :no_shipping   => 1,
        :a3            => billing_price,
        :p3            => billing_cycle,
        :t3            => 'W',
        :a3            => billing_price
    })
  end

  def paypal_encrypted(return_url, notify_url)
    encrypt_for_paypal(hash_for_paypal(return_url, notify_url))
  end

end