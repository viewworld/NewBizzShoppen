set :deploy_to, "/srv/#{application}/staging"
set :rails_env, "staging"
set :branch, "master"

after "deploy:finalize_update", "deploy_static_content"
