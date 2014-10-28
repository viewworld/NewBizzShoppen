Nbs::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # In the staging environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = true

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Disable Rails's static asset server
  # In production, Apache or nginx will already do this
  config.serve_static_assets               = true
  config.assets.compile = false
  config.assets.digest = true

  config.assets.precompile += %w( common.scss fairdeals.css fairdeals_thin.css newsletter.css campaign_materials.css countdown.scss flashphoner/trackbar.scss flashphoner/style_html.scss mizu/skin.css common.css )
  config.assets.precompile += %w( popup_email_template_editor.js email_template_signature.js global_template_editor.js global_field_validator.js deal_comments.js deal_creation.js remote_deal_requests.js jquery.lwtCountdown-1.0.js global_template_editor.js result_dynamic_value.js fairdeals.js lead_template_functions.js jquery.autocomplete.min.js jquery.counter-1.0.min.js lead_translation_functions.js lead_template_functions.js jquery.checkboxtree.min.js jquery.ui.nestedSortable.js jquery.ui.nestedSortable.custom.js jquery.field.min.js jquery.calculation.min.js invoice_calculations.js phone.js global_field_validator.js common.js ckeditor*.js )

  # Enable serving of images, stylesheets, and javascripts from an asset server
  # config.action_controller.asset_host = "http://static-fairleads.s3.amazonaws.com"

  #Required by Devise
  config.action_mailer.default_url_options = {:host => 'fairleads.selleo.com'}

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }

  config.middleware.swap ActionDispatch::ParamsParser,
                         ActionDispatch::ParamsParser,
                         Mime::JSON => lambda { |body| Yajl.load(body).with_indifferent_access }
end
