set(:rvm_ruby_string) {'1.9.3@nbs'}
set :deploy_to, "/srv/#{application}/staging2"
set :rails_env, 'staging'
set :branch, 'ruby-1.9.3'

set :delayed_job_args, "-n 2 --pid-dir=#{shared_path}/tmp/pids"

set :passenger_port, 9292
set :passenger_cmd, 'bundle exec passenger'

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    pid_file = "#{shared_path}/tmp/pids/passenger.#{passenger_port}.pid"
    log_file = "#{shared_path}/log/passenger.#{passenger_port}.log"

    run <<-CMD
      if [[ -f #{pid_file} ]];
      then
        cd #{current_path} && #{passenger_cmd} stop --pid-file #{pid_file};
      fi
    CMD

    run "cd #{current_path} && #{passenger_cmd} start -e #{rails_env} -p #{passenger_port} -d --pid-file #{pid_file} --log-file #{log_file}"
  end
end
