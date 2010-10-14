set :application, "nbs"
set :repository,  "git@github.com:Selleo/NewBizzShoppen.git"

set :scm, :git

role :web, "nbs.selleo.com"
role :app, "nbs.selleo.com"
role :db,  "nbs.selleo.com", :primary => true

set :user, "rails"
set :use_sudo, false

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
 end
