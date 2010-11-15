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
      req.params["_method"] = new_method if new_method
    end
    status, headers, response = @app.call(env)

    [status, headers, response]
  end



end
