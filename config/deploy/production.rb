set :default_environment, {
  'PATH' => "/home/rails/.rvm/gems/ree-1.8.7-2010.02@global/bin:/home/rails/.rvm/bin:/home/rails/.rvm/rubies/ree-1.8.7-2010.02/bin:$PATH",
  'RUBY_VERSION' => '1.8.7',
  'GEM_HOME'     => '/home/rails/.rvm/gems/ree-1.8.7-2010.02@nbs',
  'GEM_PATH'     => '/home/rails/.rvm/gems/ree-1.8.7-2010.02@nbs:/home/rails/.rvm/gems/ree-1.8.7-2010.02@global',
  'BUNDLE_PATH'  => '/home/rails/.rvm/gems/ree-1.8.7-2010.02@nbs'
}

set :deploy_to, "/srv/#{application}/production"
set :rails_env, "production"
set :branch, "master"

after "deploy:restart", "restart_memcached"

task :restart_memcached, :roles => :app do
  sudo "nohup /etc/init.d/memcached restart &"
end