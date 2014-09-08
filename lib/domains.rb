module Rack
  class Domains
    def initialize(app)
      @app = app
    end

    def call(env)
      env['rack.session'][:site] = site(env)
      env['rack.session'][:layout] = "layouts/#{site(env)}/application"
      @app.call env
    end

    def site(env)
      domain(env).site
    end

    private

    def domain(env)
      @domain ||=
        begin
          server_name = env['SERVER_NAME'].gsub('www.', '')
          Domain.where(name: server_name).first ||
            Domain.where(site: server_name.split('.').first).first ||
            Domain.for_site_and_locale('fairleads', I18n.locale)
        end
    end
  end
end
