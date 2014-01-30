if %w(staging production).include?(Rails.env)
  Airbrake.configure do |config|
    config.api_key = 'c7294dd91b38dc8445409e7ebc8fa0f6'
    config.host    = 'errbit.selleo.com'
    config.port    = 443
    config.secure  = config.port == 443
  end
end
