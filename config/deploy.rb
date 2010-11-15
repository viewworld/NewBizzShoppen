set :stages, %w(staging production)
set :default_stage, "staging"

set :application, "nbs"
set :app_path, "/srv/#{application}"
set :repository,  "git@github.com:Selleo/NewBizzShoppen.git"

set :scm, :git

role :web, "nbs.selleo.com"
role :app, "nbs.selleo.com"
role :db,  "nbs.selleo.com", :primary => true

set :user, "rails"
set :use_sudo, false

namespace :deploy do
  desc "Restarting god"
  task :restart, :roles => :app do
#    sudo "god restart nbs_#{stage}"
  end
end

after "deploy:finalize_update", "copy_database_yml"

task :copy_database_yml, :roles => :app do
  db_config = "#{app_path}/etc/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end

