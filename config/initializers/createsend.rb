require 'createsend'

if Rails.env.production?
  CreateSend.api_key '136475253199128526b3a7e3d8db387d'
else
  CreateSend.api_key '9fa21be9a547bd9db20e8fe670678b03'
end
