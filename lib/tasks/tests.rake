namespace :tests do
  namespace :suite do
    desc "run cucumber tests"
    task :acceptance => :environment do
      system "cucumber"
    end

    desc "run rspec tests"
    task :unit => :environment do
      system "rspec spec --format documentation"
    end
  end
end
