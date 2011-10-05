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
    `pg_dump -i -a -x #{excluded_tables} -O nbs_test -f db/snapshots/cucumber.sql`
  end
end