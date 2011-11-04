module Rack
  class Domains
    def initialize app
      @app = app
    end

    def call(env)
      if env["HTTP_HOST"][/fairdeals\.\w{2,4}/].present?
        env['rack.session'][:site] = "fairdeals"
        env['rack.session'][:layout] = "layouts/fairdeals/application"
      elsif env["HTTP_HOST"][/faircalls\.\w{2,4}/].present?
        env['rack.session'][:site] = "faircalls"
        env['rack.session'][:layout] = "layouts/faircalls/application"
      else
        env['rack.session'][:site] = "fairleads"
        env['rack.session'][:layout] = "layouts/fairleads/application"
      end
      @app.call env
    end
  end
end