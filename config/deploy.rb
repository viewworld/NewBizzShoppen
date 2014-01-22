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

set :server_ip, '144.76.32.51'

role :web, fetch(:server_ip)
role :app, fetch(:server_ip)
role :db,  fetch(:server_ip), :primary => true

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

namespace :mailcatcher do
  def rails_env
    fetch(:rails_env, false) ? "RAILS_ENV=#{fetch(:rails_env)}" : ''
  end

  def pid_file
    "/tmp/mailcatcher_#{fetch(:rails_env)}.pid"
  end

  def mailcatcher_args
    {
      :http_ip => fetch(:mailcatcher_http_ip, '127.0.0.1'),
      :http_port => fetch(:mailcatcher_http_port, '10801'),
      :smtp_ip => fetch(:mailcatcher_smtp_ip, '127.0.0.1'),
      :smtp_port => fetch(:mailcatcher_smtp_port, '1025')
    }.inject('') {|acc, (attr,val)| acc << "--#{attr.to_s.gsub('_', '-')} #{val} "}
  end

  task :stop do
    run %Q(if [ -f #{pid_file} ]; then pid=$(cat #{pid_file}) && kill -9 $pid; fi || :)
  end

  task :start do
    run "cd #{current_path} && #{rails_env} bundle exec mailcatcher #{mailcatcher_args} & echo $! && sleep 5"
    run "ps aux | grep mailcatcher | grep #{fetch(:rails_env)} | grep -v grep | awk {'print $2'} > #{pid_file}"
  end
end
