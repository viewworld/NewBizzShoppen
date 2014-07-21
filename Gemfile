source 'http://rubygems.org'

gem 'bundler'

gem 'rails', '3.0.20'
gem 'railties'
gem 'yajl-ruby', '1.1.0', :require => 'yajl'

gem 'pg'
gem 'inherited_resources', '1.1.2'
gem 'will_paginate', '3.0.pre2', :branch => 'rails3'
gem 'formtastic', '1.1.0'
gem 'liquid'
gem 'devise', '1.1.3'
gem 'delayed_job_active_record', '~> 4.0.0'
gem 'delayed_job', '>= 4.0.0'
gem 'aasm'
gem 'paperclip', '2.3.6'
gem 'scoped-search', '0.7.1', :require => 'scoped_search'
gem 'json_pure', '>= 1.4.6'
gem 'globalize3', '0.3.0'
gem 'role_model', :require => 'role_model'
gem 'cancan'
gem 'nested_set', '1.5.4'
gem 'fastercsv'
gem 'thor'
gem 'spreadsheet'
gem 'google-spreadsheet-ruby'
gem 'roo'
gem 'ckeditor', '3.4.3.pre'
gem 'aws-s3'
gem 'i18n-active_record'
gem 'whenever', '~> 0.9.0', :require => false
gem 'acts_as_commentable_with_threading'
gem 'memcache-client'
gem 'devise_rpx_connectable'
gem 'ruby-hmac', '0.4.0'
gem 'jammit-s3', :path => 'vendor/gems/jammit-s3'
gem 'ajaxful_rating', :path => 'vendor/gems/ajaxful-rating'
gem 'postmark-rails'
gem 'paypal-recurring', :path => 'vendor/gems/paypal-recurring'
gem 'paypal_nvp'
gem 'activeadmin', :path => 'vendor/gems/active_admin'
gem 'diff-lcs', :require => false
gem 'cucumber_fm-core', '0.1', :require => 'cucumber_feature_manager'
gem 'acts-as-taggable-on', '~> 2.2.2'
gem 'createsend'
gem 'recaptcha', :require => 'recaptcha/rails'
gem 'newrelic_rpm'
gem 'activerecord-database-views'
gem 'rubyzip', '0.9.9'
gem 'rails-multi_block_helpers', :github => 'bartlomiejdanek/rails-multi_block_helpers'

group :staging do
  gem 'system-metrics'
  gem 'mailcatcher'
end

group :staging, :production do
  gem 'airbrake', '~> 3.1.15'
end

group :development do
  gem 'thin'
  gem 'nifty-generators'
  gem 'bullet'
  gem 'letter_opener'
end

group :test, :development do
  gem 'pry-rails', '0.3.2'
end

group :test do
  gem 'database_cleaner', '1.2.0'
  gem 'capybara', '1.1.4'
  gem 'cucumber', '0.10.0'
  gem 'cucumber-rails', '0.3.2'
  gem 'pickle'
  gem 'spork', '1.0.0rc4'
  gem 'mocha', '0.13.2', :require => false
  gem 'faker', '0.3.1'
  gem 'machinist', '>= 2.0.0.beta1'
  gem 'fakeweb', :require => false
  gem 'webmock', :require => false
  gem 'launchy', '2.1'
  gem 'rspec-rails', '2.14.1'
  gem 'autotest-rails'
  gem 'autotest'
  gem 'headless'
  gem 'test-unit'
  gem 'shoulda-matchers', '~> 2.0.0'
  gem 'email_spec', '~> 1.5.0'
  gem 'factory_girl', '~> 2.6.4'
  # CodeClimate isn't compatible with REE (Ruby 1.8.x) it requires 1.9 or newer
  # gem 'codeclimate-test-reporter', '~> 0.3.0'
  # gem 'simplecov', '~> 0.8.2'
end

gem 'capistrano', '2.15.5'
gem 'capistrano-ext', '>= 1.2.1'
gem 'rvm-capistrano'
gem 'rake', '~> 0.8.7'
gem 'daemons', '~> 1.1.9'
