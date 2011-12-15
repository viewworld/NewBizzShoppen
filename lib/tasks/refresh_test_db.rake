namespace :nbs do
  desc "Refresh db dump for tests"
  task :refresh_test_db => :environment do
    ActiveRecord::Base.connection.disconnect!
    `rake db:drop`
    `rake db:create`
    `rake db:migrate`
    `thor nbs:seed`
    `thor nbs:t`
    excluded_tables = ["schema_migrations"].collect { |t| "-T #{t}" }.join(" ")
    `pg_dump -i -a -x #{excluded_tables} -O #{ActiveRecord::Base.configurations[ENV["RAILS_ENV"]]["database"]} -f db/snapshots/cucumber.sql`
  end

  desc "Refresh db dump for tests from snapshot"
  task :refresh_snapshot => :environment do
    ActiveRecord::Base.connection.disconnect!
    `rake db:drop`
    `rake db:create`
    `rake db:migrate`
    backup = Rails.root.join("db", "snapshots", "cucumber.sql")
    dbname = ActiveRecord::Base.configurations[ENV["RAILS_ENV"]]["database"]
    dbuser = ActiveRecord::Base.configurations[ENV["RAILS_ENV"]]["username"]
    `psql -U #{dbuser} -d #{dbname} -f #{backup}`
  end

end