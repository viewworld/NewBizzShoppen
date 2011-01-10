set :stages, %w(staging production)
set :default_stage, "staging"

set :application, "nbs"
set :app_path, "/srv/#{application}"
set :repository,  "git@github.com:Selleo/NewBizzShoppen.git"

set :scm, :git
set :ssh_options, {:forward_agent => true}

role :web, "ec2-46-137-126-18.eu-west-1.compute.amazonaws.com"
role :app, "ec2-46-137-126-18.eu-west-1.compute.amazonaws.com"
role :db,  "ec2-46-137-126-18.eu-west-1.compute.amazonaws.com", :primary => true

set :user, "rails"
set :use_sudo, false

set :keep_releases, 3

#namespace :deploy do
#  desc "Restarting god"
#  task :restart, :roles => :app do
#    sudo "/opt/rubybin/god restart nbs_#{stage}"
#  end
#end

#after "deploy:finalize_update", "prepare_database"

#task :prepare_database, :roles => :app do
#  db_config = "#{app_path}/etc/database.yml"
#  run "cp #{db_config} #{release_path}/config/database.yml"
#  run "cp #{app_path}/etc/.rvmrc #{release_path}/.rvmrc"
#end

