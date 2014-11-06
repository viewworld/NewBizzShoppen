require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'email_spec'
require 'rspec/autorun'
require 'selleo_controller_tests'
require 'paperclip/matchers'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.include FactoryGirl::Syntax::Methods
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)
  config.include Paperclip::Shoulda::Matchers

  config.include(Selleo::XhrPersistence)
  config.with_options(type: :controller) do |config|
    config.extend Selleo::ControllerMacros
  end

  FactoryGirl.reload

  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.before(type: :controller) do
    request.env['HTTP_REFERER'] = '/'
  end

  config.after do
    Warden.test_reset!
  end
end
