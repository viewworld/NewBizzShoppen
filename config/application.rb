require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(assets: %w(development test ci)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Nbs
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
    config.active_record.observers = []
    config.active_record.observers << :lead_observer unless File.basename($0) == "rake"

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'UTC'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # JavaScript files you want as :defaults (application.js is always included).
    config.action_view.javascript_expansions[:defaults] = ['jquery-1.4.2.min', 'jquery-ui-1.8.5.custom.min', 'jquery.ui.timepicker', 'jquery-ujs/src/rails']

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding                                     = "utf-8"

    # Assets pipeline
    config.assets.enabled = true
    config.assets.version = '1.0'

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters                            += [:password]

    #require "notification_responder"
    #config.middleware.use "Rack::NotificationResponder"

    require "locale_setter"
    config.middleware.use "Rack::LocaleSetter"

    require "domains"
    require "fairdeals"
    require "faircalls"
    require "erhvervsanalyse"
    config.middleware.use "Rack::Domains"

    require "bulk_process"
    config.middleware.use "BulkProcess"

    require "#{config.root}/app/modules/custom_redirect.rb"

    require "#{config.root}/lib/settings.rb"
    require "#{config.root}/lib/column_path.rb"

    require "#{config.root}/lib/currency_converter.rb"

    require "#{config.root}/lib/i18n_utils.rb"
    require "#{config.root}/lib/string_utils.rb"
    config.after_initialize do
      I18nUtils.populate! if Rails.env == "development"
      I18nUtils.export_for_js!("common.js")
    end

    I18n.available_locales = [:en, :dk, :cz, :da, :ru]
    I18n.enforce_available_locales = true
  end
end
