module Rack
  class LocaleSetter
    def initialize app
      @app = app
    end

    def locales
      @locales ||= Locale.all.map(&:code)
    end

    def translate_locale(locale)
      dictionary = {'eu' => 'en', 'com' => 'en', 'dk' => 'da'}
      locale = dictionary[locale.to_s] || locale.to_s
      locales.include?(locale) ? locale : 'en'
    end

    def find_locale(env)
       env['rack.session'][:locale_code] || env["HTTP_HOST"].to_s[/fairdeals\.(\w{2,4})/,1] || env["HTTP_HOST"].to_s[/faircalls\.(\w{2,4})/,1] || env["HTTP_ACCEPT_LANGUAGE"].to_s[/^([a-z]{2})/]
    end

    def call(env)
      I18n.locale = env['rack.session'][:locale_code] = translate_locale(find_locale(env))
      @app.call env
    end
  end
end