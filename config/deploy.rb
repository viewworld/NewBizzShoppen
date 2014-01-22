# = Setup:
# cap deploy:setup
# cap deploy
# cap deploy:bundle_install

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set(:rvm_ruby_string) {"ree@nbs"}
set :delayed_job_args, "-n 2"
set :delayed_job_command, 'bundle exec script/delayed_job'

set :stages, %w(staging production testing)
set :default_stage, "staging"

set :application, "nbs"
set :app_path, "/srv/#{application}"
set :repository,  "git@github.com:Selleo/NewBizzShoppen.git"

set :scm, :git
set :ssh_options, {:forward_agent => true}
set :rvm_type, :user

role :web, "144.76.32.51"
role :app, "144.76.32.51"
role :db,  "144.76.32.51", :primary => true

set :bundle_without, [:development, :test]

set :user, "rails"
set :use_sudo, false
set(:rails_env) {stage}

set :keep_releases, 3

namespace :deploy do
  task :start do
    sudo "/etc/init.d/nbs_#{stage} start"
  end

  task :stop do
    sudo "/etc/init.d/nbs_#{stage} stop"
  end

  task :restart do
    sudo "/etc/init.d/nbs_#{stage} reload"
  end
end

after "deploy:finalize_update", "prepare_database"
after "deploy:finalize_update", "deploy:cleanup"

after "deploy:restart", "delayed_job:restart"

task :prepare_database, :roles => :app do
  run "cp #{app_path}/etc/database.yml #{release_path}/config/database.yml"
end
