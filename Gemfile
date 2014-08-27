source 'http://rubygems.org'
ruby '1.9.3'

# basics
gem 'bundler', '1.6.5'
gem 'rails', '3.1.12'

# db
gem 'pg', '~> 0.17.1'

# auth
gem 'devise', '1.1.9'
gem 'devise_rpx_connectable', '0.2.2'
gem 'cancan', '1.6.5'

# models
gem 'inherited_resources', '1.3.1'
gem 'role_model', require: 'role_model'
gem 'acts-as-taggable-on', '~> 2.2.2'
gem 'acts_as_commentable_with_threading', '1.1.2'
gem 'acts_as_list', '~> 0.4.0'
gem 'nested_set', '1.5.4'

# requirements
gem 'yajl-ruby', '1.1.0', require: 'yajl'
gem 'recaptcha', '0.3.5', require: 'recaptcha/rails'

# s3
gem 'aws-s3'
gem 'jammit-s3', '~> 0.6.0.2'

# views
gem 'slim', '~> 2.0.3'
gem 'slim-rails', '~> 2.1.5'
gem 'ckeditor', '3.4.3.pre'
gem 'will_paginate', '3.0.7'
gem 'formtastic', '1.1.0'
gem 'liquid', '2.2.2'
gem 'ajaxful_rating', '3.0.0.beta3'
gem 'draper', '~> 1.3.1'

# background jobs
gem 'delayed_job_active_record', '~> 4.0.0'
gem 'delayed_job', '>= 4.0.0'
gem 'aasm', '2.3.1'
gem 'whenever', '~> 0.9.0', require: false

# uploads
gem 'paperclip', '2.3.6'

# api
gem 'json_pure', '>= 1.4.6'
gem 'google-spreadsheet-ruby', '0.1.5'
gem 'spreadsheet', '0.6.5.5'

# locales
gem 'globalize3', '0.3.0'
gem 'i18n-active_record', git: 'git://github.com/svenfuchs/i18n-active_record.git', ref: "22b1f76", require: 'i18n/active_record'

# paypal
gem 'paypal-recurring', path: 'vendor/gems/paypal-recurring'
gem 'paypal_nvp', '0.2.0'

# mailing
gem 'createsend', '1.0.3'
gem 'postmark-rails', '0.4.2'

# utils
gem 'thor', '0.14.6'
gem 'roo', '1.9.5'
gem 'memcache-client', '1.8.5'
gem 'ruby-hmac', '0.4.0'
gem 'diff-lcs', require: false
gem 'newrelic_rpm', '3.6.8.168'
gem 'activerecord-database-views', '0.1.0'
gem 'rubyzip', '0.9.9'
gem 'rails-multi_block_helpers', github: 'bartlomiejdanek/rails-multi_block_helpers'
gem 'stringex', '~> 2.5.2'

group :staging do
  gem 'system-metrics', '0.2.4'
  gem 'mailcatcher', '0.2.4'
end

group :staging, :production do
  gem 'airbrake', '~> 3.1.15'
end

group :development do
  gem 'thin', '~> 1.5.1'
  gem 'nifty-generators', '0.4.6'
  gem 'bullet', '2.0.1'
  gem 'letter_opener', '0.0.2'
end

group :test, :development do
  gem 'pry-rails', '0.3.2'
  gem 'pry', '0.9.12.6'
  gem 'pry-debugger', '0.2.3'

  #gem 'better_errors', '~> 1.1.0'
  #gem 'binding_of_caller', '~> 0.7.2'
  #gem 'quiet_assets', '~> 1.0.3'

  gem 'factory_girl_rails', '~> 4.4.1'
end

group :test do
  gem 'database_cleaner', '1.2.0'
  gem 'capybara', '1.1.4'
  gem 'mocha', '0.13.2', require: false
  gem 'faker', '0.3.1'
  gem 'machinist', '>= 2.0.0.beta1'
  gem 'fakeweb', require: false
  gem 'webmock', require: false
  gem 'launchy', '2.1'
  gem 'rspec-rails', '2.14.1'
  gem 'headless'
  gem 'test-unit'
  gem 'shoulda-matchers', '~> 2.0.0'
  gem 'email_spec', '~> 1.5.0'
end

gem 'capistrano', '2.15.5'
gem 'capistrano-ext', '>= 1.2.1'
gem 'rvm-capistrano'
gem 'rake', '~> 10.3.2'
gem 'daemons', '~> 1.1.9'
