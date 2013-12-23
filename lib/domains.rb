module Rack
  class Domains
    def initialize app
      @app = app
    end

    def call(env)
      domain = Domain.where(:name => env["SERVER_NAME"].gsub('www.', '')).first || Domain.for_site_and_locale('fairleads', I18n.locale)
      env['rack.session'][:site] = domain.site
      env['rack.session'][:layout] = "layouts/#{domain.site}/application"
      @app.call env
    end
  end
end