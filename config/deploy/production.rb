set :deploy_to, "/srv/#{application}/production"
set :rails_env, "production"
set :branch, "master"

after "deploy:restart", "restart_memcached"
after "deploy:finalize_update", "deploy_static_content"

task :restart_memcached, :roles => :app do
  sudo "nohup /etc/init.d/memcached restart &"
end

task :deploy_static_content, :roles => :app do
  run "cd #{release_path}; RAILS_ENV=#{stage} bundle exec thor i18n:js; bundle exec vendor/gems/jammit-s3/bin/jammit-s3 --base-url static-fairleads.s3.amazonaws.com"
end
