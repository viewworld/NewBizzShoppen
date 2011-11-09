include ActiveSupport::SecureRandom
namespace :teamcity do

  desc "prepare database with random name"
  task :random_db do
    system "cp /home/teamcity/nbs.main.database.yml config/database.yml"
    y = YAML.load_file('config/database.yml')
    y["test"]["database"] = "#{y["test"]["database"]}_#{SecureRandom.hex(10)}"
    File.open('config/database.yml','w') {|out| YAML.dump(y, out)}
  end

  desc "run cucumber tests"
  task :cucumber do
    system "rake teamcity:random_db RAILS_ENV=test"
    system "rake db:create RAILS_ENV=test"
    system "rake nbs:refresh_test_db RAILS_ENV=test"
    system "cucumber -p teamcity --format junit --out tmp/cucumber-junit"
    system "rake db:drop RAILS_ENV=test"
  end

  desc "run cucumber javascript tests"
  task :cucumber_js do
    system "rake teamcity:random_db RAILS_ENV=test"
    system "rake db:create RAILS_ENV=test"
    system "rake nbs:refresh_test_db RAILS_ENV=test"
    system "cucumber -p javascript --format junit --out tmp/cucumber-junit"
    system "rake db:drop RAILS_ENV=test"
  end

  desc "run cucumber javascript tests"
  task :cucumber_parallel do
    $LOAD_PATH << "vendor/plugins/parallel_tests/lib"
    require "parallel_tests"
    executable = File.join(Rails.root, 'vendor', 'plugins', 'parallel_tests', 'bin', 'parallel_test')
    count, pattern, options = ParallelTests.parse_rake_args(args)
    system "#{executable} --exec 'rake nbs:refresh_test_db RAILS_ENV=test' -n #{count}"
    command = "#{executable} --type features -n #{count} -p '#{pattern}' -r '#{Rails.root}' -o '#{options}'"
    abort unless system(command) # allow to chain tasks e.g. rake parallel:spec parallel:features
  end

end