# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.

worker_processes 4

working_directory "/srv/nbs/staging/current"

#listen "/srv/nbs/staging/shared/pids/staging.socket", :backlog => 64
listen 40000, :backlog => 64

timeout 30

user 'rails', 'rails'
shared_path = "/srv/nbs/staging/shared"
pid "#{shared_path}/pids/unicorn.pid"
stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"
