class Fairdeals
  def self.matches?(request)
    request.env['rack.session'][:site] == "fairdeals"
  end
end

module Rack
  class Fairdeals
    def initialize app
      @app = app
    end

    def call(env)
      if env["HTTP_HOST"][/fairdeals\.\w{2,4}/].present?
        env['rack.session'][:site] = "fairdeals"
      else
        env['rack.session'][:site] = "fairleads"
      end
      @app.call env
    end
  end
end