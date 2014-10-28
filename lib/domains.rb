module Rack
  class Domains
    def initialize(app)
      @app = app
      @domains ||= {}
    end

    def call(env)
      domain = @domains[env['SERVER_NAME']] ||= site(env)
      env['rack.session'][:site] = domain
      env['rack.session'][:layout] = "layouts/#{domain}/application"
      @app.call env
    end

    private

    def site(env)
      domain(env).site
    end

    def domain(env)
      server_name = env['SERVER_NAME'].gsub('www.', '')
      Domain.where(name: server_name).first ||
        Domain.where(site: server_name.split('.').first).first ||
        Domain.for_site_and_locale('fairleads', I18n.locale)
    end
  end
end
