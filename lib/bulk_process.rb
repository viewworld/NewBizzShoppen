class BulkProcess

  def initialize(app)
     @app = app
   end

  def call(env)
    if env['rack.request.form_hash'] && env['rack.request.form_hash']['route_to']
      new_url = env['rack.request.form_hash']['route_to']
      env['PATH_INFO'] =   new_url
      env['REQUEST_URI'] = new_url
      env["REQUEST_PATH"] = new_url
    end
    status, headers, response = @app.call(env)

    [status, headers, response]
  end



end