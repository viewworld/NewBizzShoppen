module Rack
  class LocaleSetter
    def initialize app
      @app = app
    end

    def call env
      dictionary = {'da' => 'dk'}
      locale = env['rack.session'][:locale_code] || env["HTTP_ACCEPT_LANGUAGE"].match(/^([a-z]{2})/)
      env['rack.session'][:locale_code] = (dictionary[locale.to_s] || locale.to_s)
      I18n.locale = env['rack.session'][:locale_code]
      @app.call env
    end
  end
end