module PaypalPayment

  PAYPAL_CERT_PEM = File.read("#{Rails.root}/certs/#{Rails.env == 'production' ? 'production' : 'staging'}/paypal_cert.pem")
  APP_CERT_PEM = File.read("#{Rails.root}/certs/#{Rails.env == 'production' ? 'production' : 'staging'}/app_cert.pem")
  APP_KEY_PEM = File.read("#{Rails.root}/certs/#{Rails.env == 'production' ? 'production' : 'staging'}/app_key.pem")

  def encrypt_for_paypal(values)
    signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
    OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
  end

  def paypal_encrypted(return_url, notify_url)
    encrypt_for_paypal(hash_for_paypal(return_url, notify_url))
  end

end