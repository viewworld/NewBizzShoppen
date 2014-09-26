# = Setup:
# cap deploy:setup
# cap deploy
# cap deploy:bundle_install

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set(:rvm_ruby_string) {"ree@nbs"}
set :delayed_job_args, "-n 2"
set :delayed_job_command, 'bundle exec script/delayed_job'

set :stages, %w(staging production staging2)
set :default_stage, "staging"
set(:rails_env) {stage}

set :application, "nbs"
set :app_path, "/srv/#{application}"
set :repository,  "git@github.com:Selleo/NewBizzShoppen.git"

set :scm, :git
set :ssh_options, {:forward_agent => true}
set :rvm_type, :user

set :server_ip, '144.76.32.51'

role :web, fetch(:server_ip)
role :app, fetch(:server_ip)
role :db,  fetch(:server_ip), :primary => true

set :bundle_without, [:development, :test]

set :user, 'rails'
set :use_sudo, false

set :keep_releases, 3

set :whenever_environment, defer { rails_env }
set :whenever_identifier, defer { "#{application}_#{stage}" }
set :whenever_command, 'bundle exec whenever'
require "whenever/capistrano/v2/recipes"

before 'deploy:restart', 'whenever:update_crontab'
before 'deploy:restart', 'deploy:migrate'
after 'deploy:rollback', 'whenever:update_crontab'

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

task :deploy_static_content, :roles => :app do
  run "cd #{release_path}; RAILS_ENV=#{stage} bundle exec thor i18n:js; bundle exec vendor/gems/jammit-s3/bin/jammit-s3 --base-url static-fairleads.s3.amazonaws.com"
end
