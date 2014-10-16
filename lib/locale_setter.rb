module Rack
  class LocaleSetter
    def initialize(app)
      @app = app
    end

    def call(env)
      I18n.locale = env['rack.session'][:locale_code] = translate_locale(find_locale(env))
      @app.call env
    end

    private

    def locales
      @locales ||= Locale.all.map(&:code)
    end

    def translate_locale(locale)
      locale = dictionary[locale] || locale
      locales.include?(locale) ? locale : 'en'
    end

    def find_locale(env)
      @env_locale = (env['rack.session'][:locale_code] ||
        env['HTTP_HOST'].to_s[/fairdeals\.(\w{2,4})/,1] ||
        env['HTTP_HOST'].to_s[/faircalls\.(\w{2,4})/,1] ||
        env['HTTP_ACCEPT_LANGUAGE'].to_s[/^([a-z]{2})/]).to_s
    end

    def dictionary
      {'eu' => 'en', 'com' => 'en', 'dk' => 'da'}
    end
  end
end
