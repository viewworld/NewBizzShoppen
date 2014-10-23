Nbs::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  config.plugins = [ :e_template ]

  # The production environment is meant for finished, "live" apps.
  # Code is not reloaded between requests
  config.cache_classes                     = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Assets
  config.assets.compress = true
  config.assets.compile = false
  config.assets.digest = false

  # Specifies the header that your server uses for sending files
  #config.action_dispatch.x_sendfile_header = "X-Sendfile"

  # For nginx:
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'

  # If you have no front-end server that supports something like X-Sendfile,
  # just comment this out and Rails will serve the files

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Use a different logger for distributed setups
  # config.logger = SyslogLogger.new

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Disable Rails's static asset server
  # In production, Apache or nginx will already do this
  config.serve_static_assets = false
  config.assets.precompile += %w( common.css fairdeals.css fairdeals_thin.css newsletter.css campaign_materials.css countdown.scss flashphoner/trackbar.scss flashphoner/style_html.scss mizu/skin.css )
  config.assets.precompile += %w( popup_email_template_editor.js email_template_signature.js global_template_editor.js global_field_validator.js deal_comments.js deal_creation.js remote_deal_requests.js jquery.lwtCountdown-1.0.js global_template_editor.js result_dynamic_value.js fairdeals.js lead_template_functions.js jquery.autocomplete.min.js jquery.counter-1.0.min.js lead_translation_functions.js lead_template_functions.js jquery.checkboxtree.min.js jquery.ui.nestedSortable.js jquery.ui.nestedSortable.custom.js jquery.field.min.js jquery.calculation.min.js invoice_calculations.js phone.js global_field_validator.js common.js )

  # Enable serving of images, stylesheets, and javascripts from an asset server
  config.action_controller.asset_host = "https://static-fairleads.s3.amazonaws.com"

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  #config.i18n.fallbacks                    = true

  config.action_mailer.default_url_options = {:host => 'fairleads.com'}

  # Send deprecation notices to registered listeners
  config.active_support.deprecation        = :notify

  config.action_mailer.delivery_method     = :postmark
  config.action_mailer.postmark_settings = { :api_key => "a132d83a-7585-444a-b3cf-a522acfcb9fb" }
  #config.action_mailer.smtp_settings       = {:address              => "smtp.gmail.com",
  #                                            :port                 => 587,
  #                                            :domain               => 'fairleads.com',
  #                                            :user_name            => 'noreply@fairleads.com',
  #                                            :password             => 'myfairleads',
  #                                            :authentication       => 'plain',
  #                                            :enable_starttls_auto => true}

  config.middleware.swap ActionDispatch::ParamsParser,
                         ActionDispatch::ParamsParser,
                         Mime::JSON => lambda { |body| Yajl.load(body).with_indifferent_access }
end
