namespace :teamcity do

  desc "run cucumber tests"
  task :cucumber do
    system "rake nbs:refresh_test_db RAILS_ENV=test"
    system "cucumber --tags @m1,@m2 --format junit --out tmp/cucumber-junit"
  end

end