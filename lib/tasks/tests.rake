namespace :tests do
  namespace :suite do
    desc 'run cucumber tests'
    task :acceptance => :environment do
      system 'cucumber'
    end

    desc 'run rspec tests'
    task :unit => :environment do
      system 'rspec spec --format documentation'
    end

    namespace :prepare do
      task :acceptance => :environment do
        Rake::Task['nbs:refresh_test_db'].invoke
      end

      task :unit => :environment do
      end
    end
  end
end
