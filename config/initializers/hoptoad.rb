if ['production','staging','testing'].include?(Rails.env)
  HoptoadNotifier.configure do |config|
    config.api_key = '68a3fbd1a1da77320468b22d1bc51aaf'
  end
end