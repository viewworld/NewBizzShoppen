set :default_environment, {
  'PATH' => "/home/rails/.rvm/gems/ree-1.8.7-2010.02@global/bin:/home/rails/.rvm/bin:/home/rails/.rvm/rubies/ree-1.8.7-2010.02/bin:$PATH",
  'RUBY_VERSION' => '1.8.7',
  'GEM_HOME'     => '/home/rails/.rvm/gems/ree-1.8.7-2010.02@nbs',
  'GEM_PATH'     => '/home/rails/.rvm/gems/ree-1.8.7-2010.02@nbs:/home/rails/.rvm/gems/ree-1.8.7-2010.02@global',
  'BUNDLE_PATH'  => '/home/rails/.rvm/gems/ree-1.8.7-2010.02@nbs'
}

default_run_options[:pty] = true

set :stages, %w(staging production)
set :default_stage, "staging"

set :application, "nbs"
set :app_path, "/srv/#{application}"
set :repository,  "git@github.com:Selleo/NewBizzShoppen.git"

set :scm, :git
set :ssh_options, {:forward_agent => true}

role :web, "fairleads.com"
role :app, "fairleads.com"
role :db,  "fairleads.com", :primary => true

set :user, "rails"
set :use_sudo, false

set :keep_releases, 3

namespace :deploy do
  desc "Restarting god"
  task :restart, :roles => :app do
    sudo "/opt/ruby-enterprise-1.8.7-2010.02/bin/god restart nbs_#{stage}"
  end
end

after "deploy:finalize_update", "prepare_database"

task :prepare_database, :roles => :app do
  db_config = "#{app_path}/etc/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end

