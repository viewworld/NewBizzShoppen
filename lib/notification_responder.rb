module Rack
  class NotificationResponder

    def initialize app
      @app = app
    end

    def notifications_env(env)
      @limit = CGI::parse(env["QUERY_STRING"])["limit"].first
      klass, object_id = env["rack.session"]["warden.user.user.key"]
      @current_user = klass.constantize.find(object_id)
    end

    def index(env)
      notifications_env(env)
      @notifications = @current_user.with_role.notifications.pending.order("id ASC").limit(@limit)
      [200, {"Content-Type" => "application/json"}, @notifications.to_json]
    end

    def update(env)
      notifications_env(env)
      @notification = @current_user.with_role.notifications.find(env["REQUEST_PATH"][/\/notifications\/(\d+).json/,1])
      res = @notification.update_attribute(:dismissed_at, Time.now)
      [200, {"Content-Type" => "application/json"}, "#{res}"]
    end

    def call(env)
      if env["REQUEST_PATH"][/\/notifications.json/] and env["REQUEST_METHOD"] == "GET"
        index env
      elsif env["REQUEST_PATH"][/\/notifications\/\d+.json/] and env["REQUEST_METHOD"] == "PUT"
        update env
      else
        @app.call env
      end
    end

  end
end