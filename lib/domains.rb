module Rack
  class Domains
    def initialize app
      @app = app
    end

    def call(env)
      env['rack.session'][:site] = domain(env).site
      env['rack.session'][:layout] = "layouts/#{domain(env).site}/application"
      @app.call env
    end

    private

    def domain(env)
      Domain.where(:name => env["SERVER_NAME"].gsub('www.', '')).first ||
        Domain.where(:site => env["SERVER_NAME"].gsub('www.', '').split('.').first).first ||
        Domain.for_site_and_locale('fairleads', I18n.locale)
    end
  end
end
