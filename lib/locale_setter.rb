module Rack
  class LocaleSetter
    def initialize app
      @app = app
    end

    def locales
      @locales ||= Locale.all.map(&:code)
    end

    def translate_locale(locale)
      dictionary = {'da' => 'dk'}
      dictionary[locale.to_s] || locale.to_s
    end

    def find_locale(env)
      locale = (env['SERVER_NAME'].to_s[/.*\.(\w{2,3})$/,1].to_a & locales).first ||
                env['rack.session'][:locale_code] ||
                env["HTTP_ACCEPT_LANGUAGE"].to_s[/^([a-z]{2})/]
      locales.include?(locale) ? locale : 'en'
    end

    def call(env)
      I18n.locale = env['rack.session'][:locale_code] = translate_locale(find_locale(env))
      @app.call env
    end
  end
end