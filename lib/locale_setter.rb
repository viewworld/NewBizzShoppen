module Rack
  class LocaleSetter
    def initialize app
      @app = app
    end

    def call env
      dictionary = {'da' => 'dk'}
      locale = env['rack.session'][:locale_code] || env["HTTP_ACCEPT_LANGUAGE"].to_s[/^([a-z]{2})/]
      locale = (dictionary[locale.to_s] || locale.to_s)
      env['rack.session'][:locale_code] = Locale.all.map(&:code).include?(locale) ? locale : 'en'
      I18n.locale = env['rack.session'][:locale_code]
      @app.call env
    end
  end
end