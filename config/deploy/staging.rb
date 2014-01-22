set :deploy_to, "/srv/#{application}/staging"
set :rails_env, "staging"
set :branch, "master"

set :mailcatcher_smtp_ip, 'localhost'
set :mailcatcher_smtp_port, 1025

set :mailcatcher_http_ip, fetch(:server_ip)
set :mailcatcher_http_port, 10801
