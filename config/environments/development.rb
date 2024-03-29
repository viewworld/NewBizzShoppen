Nbs::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  #Required by Devise
  config.action_mailer.default_url_options = {:host => 'localhost:3000'}

  # Enable serving of images, stylesheets, and javascripts from an asset server
  #config.action_controller.asset_host = "http://static-fairleads.s3.amazonaws.com"

  config.action_mailer.delivery_method = :letter_opener
  #config.action_mailer.smtp_settings = {:address => "smtp.gmail.com",
  #                                      :port => 587,
  #                                      :domain => 'newbizzshoppen.com',
  #                                      :user_name => 'selleo.test1@gmail.com',
  #                                      :password => 'selleotest',
  #                                      :authentication => 'plain',
  #                                      :enable_starttls_auto => true}

#  config.after_initialize do
#    Bullet.enable = true
#    Bullet.alert = false
#    Bullet.bullet_logger = true
#    Bullet.console = true
#    Bullet.rails_logger = false
#    Bullet.disable_browser_cache = true
#  end
  config.middleware.swap ActionDispatch::ParamsParser,
                         ActionDispatch::ParamsParser,
                         Mime::JSON => lambda { |body| Yajl.load(body).with_indifferent_access }
end

I18n.default_locale = :"en"

