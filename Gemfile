source 'http://rubygems.org'

gem 'rails', '3.0.0'
gem 'railties'

gem 'mongrel'
gem 'pg', '0.9.0'
gem 'inherited_resources'
gem "will_paginate", :git => "http://github.com/mislav/will_paginate.git", :branch => "rails3"
gem 'formtastic', '1.1.0'
gem 'liquid'
gem 'devise', '1.1.3'
gem 'delayed_job', ' >= 2.1.0.pre2'
gem 'hoptoad_notifier'
gem "transitions", :require => ["transitions", "active_record/transitions"]
gem 'paperclip', "2.3.3"
gem 'scoped-search', '0.7.1', :require => "scoped_search"
gem 'json_pure', '>= 1.4.6'
gem 'globalize3'
gem 'role_model', :require => "role_model"
gem 'cancan'
gem 'rails-settings', :require => "settings"
gem 'nested_set'
gem 'fastercsv'

group :development do
  gem 'diff-lcs'
  gem 'tolk', :git => "http://github.com/10to1/tolk.git", :branch => "rails3"
end

group :test do
  gem 'database_cleaner'
  gem 'capybara'
  gem 'cucumber', ">= 0.9.0"
  gem 'cucumber-rails'
  gem 'test-unit'
  gem 'pickle'
  gem 'spork'
  gem 'mocha'
  gem 'faker'
  gem 'machinist', '>= 2.0.0.beta1'
  gem 'gherkin', '>= 2.2.4'

# Added the following because rake features also complained about spec/expectations
  gem 'rspec', '=2.0.1'
  gem 'launchy' # So you can do Then show me the page
  gem "rspec-rails", "= 2.0.1"
  gem 'autotest-rails'
  gem 'autotest'
  gem 'culerity'
  gem 'celerity', :require => nil # JRuby only.
end

gem 'capistrano'
gem 'capistrano-ext', '>= 1.2.1'