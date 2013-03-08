# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.

worker_processes 4

working_directory "/srv/nbs/production/current"

listen "/srv/nbs/production/shared/pids/production.socket", :backlog => 64

timeout 30

user 'rails', 'rails'
shared_path = "/srv/nbs/production/shared"
pid "#{shared_path}/pids/unicorn.pid"
stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"