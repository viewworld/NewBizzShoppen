set :default_environment, {
  'PATH' => "/home/rails/.rvm/gems/ree-1.8.7-2010.02@global/bin:/home/rails/.rvm/bin:/home/rails/.rvm/rubies/ree-1.8.7-2010.02/bin:$PATH",
  'RUBY_VERSION' => '1.8.7',
  'GEM_HOME'     => '/home/rails/.rvm/gems/ree-1.8.7-2010.02@testing',
  'GEM_PATH'     => '/home/rails/.rvm/gems/ree-1.8.7-2010.02@testing:/home/rails/.rvm/gems/ree-1.8.7-2010.02@global',
  'BUNDLE_PATH'  => '/home/rails/.rvm/gems/ree-1.8.7-2010.02@testing'
}

set :deploy_to, "/srv/#{application}/testing"
set :rails_env, "testing"
set :branch, "m24_paypal_subscriptions"
