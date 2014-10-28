set :deploy_to, "/srv/#{application}/production"
set :rails_env, "production"
set :branch, "staging"

after "deploy:restart", "restart_memcached"

task :restart_memcached, :roles => :app do
  sudo "nohup /etc/init.d/memcached restart &"
end
