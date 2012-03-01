set :default_environment, {
  'PATH' => "/home/rails/.rvm/gems/ree-1.8.7-2010.02@global/bin:/home/rails/.rvm/bin:/home/rails/.rvm/rubies/ree-1.8.7-2010.02/bin:$PATH",
  'RUBY_VERSION' => '1.8.7',
  'GEM_HOME'     => '/home/rails/.rvm/gems/ree-1.8.7-2010.02@staging',
  'GEM_PATH'     => '/home/rails/.rvm/gems/ree-1.8.7-2010.02@staging:/home/rails/.rvm/gems/ree-1.8.7-2010.02@global',
  'BUNDLE_PATH'  => '/home/rails/.rvm/gems/ree-1.8.7-2010.02@staging'
}

set :deploy_to, "/srv/#{application}/staging"
set :rails_env, "staging"
set :branch, "next"
