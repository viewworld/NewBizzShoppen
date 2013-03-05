default_run_options[:pty] = true

set :stages, %w(staging production testing)
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
    sudo "/opt/ree/bin/god restart nbs_#{stage}"
    sudo "/opt/ree/bin/god restart dj_#{stage}"
  end
end

after "deploy:finalize_update", "prepare_database"
after "deploy:finalize_update", "deploy:cleanup"

task :prepare_database, :roles => :app do
  db_config = "#{app_path}/etc/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
  run "cd #{release_path} && bundle --quiet"
end
