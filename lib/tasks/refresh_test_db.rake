namespace :nbs do
  desc "Refresh db dump for tests"
  task :refresh_test_db => :environment do
    ["db:drop",
    "db:create",
    "db:migrate",
    "db:seed"].each do |task|
      Rake::Task[task].invoke
    end
    excluded_tables = ["schema_migrations"].collect { |t| "-T #{t}" }.join(" ")
    `pg_dump -i -a -x #{excluded_tables} -O nbs_test -f db/snapshots/cucumber.sql`
  end
end