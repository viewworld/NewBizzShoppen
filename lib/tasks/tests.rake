namespace :tests do
  namespace :suite do
    desc 'run cucumber tests'
    task :acceptance => :environment do
      unless system 'cucumber'
        fail 'acceptance suite not passed'
      end
    end

    desc 'run rspec tests'
    task :unit => :environment do
      unless system 'rspec spec --format documentation'
        fail 'rSpec suite not passed'
      end
    end

    namespace :prepare do
      task :acceptance => :environment do
        Rake::Task['nbs:refresh_test_db'].invoke
        system 'sed -i".bak" "/SET lock_timeout/d" db/snapshots/cucumber.sql'
      end

      task :unit => :environment do
      end
    end
  end
end
