module Rack
  class LocaleSetter
    def initialize app
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
      locale = dictionary[locale.to_s] || locale.to_s
      locales.include?(locale) ? locale : 'en'
    end

    def find_locale(env)
      if get_domain_locale('fairdeals', env) == 'cz'
        'cz'
      else
        env['rack.session'][:locale_code] ||
          get_domain_locale('fairdeals', env) ||
          get_domain_locale('faircalls', env) ||
          env['HTTP_ACCEPT_LANGUAGE'].to_s[/^([a-z]{2})/]
      end
    end

    def get_domain_locale(domain, env)
      env['HTTP_HOST'].to_s[/#{domain}\.(\w{2,4})/,1]
    end

    def dictionary
      {'eu' => 'en', 'com' => 'en', 'dk' => 'da', 'cz' => 'cs'}
    end
  end
end
