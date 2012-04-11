require 'rubygems'
require 'spork'
require 'fakeweb'

FakeWeb.allow_net_connect = %r{(.*paypal\.com.*)$}

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However, 
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  # This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

  RSpec.configure do |config|
    config.mock_with :mocha
    config.before(:each) { Machinist.reset_before_test }
    config.fixture_path               = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
  end

end

Spork.each_run do
  # This code will be run each time you run your specs.

end





