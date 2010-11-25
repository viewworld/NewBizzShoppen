class BulkProcess

  def initialize(app)
     @app = app
   end

  def call(env)
    req = Rack::Request.new(env)
    req.params["_method"] = "POST"
    if env['rack.request.form_hash'] && env['rack.request.form_hash']['route_to']
      new_url, new_method = env['rack.request.form_hash']['route_to'].split("#")
      env['PATH_INFO'] =   new_url
      env['REQUEST_URI'] = new_url
      env["REQUEST_PATH"] = new_url
      if new_method
        env["REQUEST_METHOD"] = new_method
        req.params["_method"] = new_method
      end
    session = env['rack.session']
    session[:bulk_action_back] = env["REQUEST_METHOD"] == "GET" ? new_url : env["HTTP_REFERER"]
    end
    status, headers, response = @app.call(env)

    [status, headers, response]
  end
end
