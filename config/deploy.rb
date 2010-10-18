set :application, "nbs"
set :repository,  "git@github.com:Selleo/NewBizzShoppen.git"
set :deploy_to, "/srv/#{application}"

set :scm, :git

role :web, "nbs.selleo.com"
role :app, "nbs.selleo.com"
role :db,  "nbs.selleo.com", :primary => true

set :user, "rails"
set :use_sudo, false

after "deploy:finalize_update", "copy_database_yml"

task :copy_database_yml, :roles => :app do
  db_config = "#{deploy_to}/etc/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end

