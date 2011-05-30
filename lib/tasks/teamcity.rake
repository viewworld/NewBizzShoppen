namespace :teamcity do

  desc "run cucumber tests"
  task :cucumber do
    system "ln -s /home/teamcity/nbs.main.database.yml config/database.yml"
    system "rake nbs:refresh_test_db RAILS_ENV=test"
    system "cucumber -p teamcity --format junit --out tmp/cucumber-junit"
  end

  desc "run cucumber javascript tests"
  task :cucumber_js do
    system "ln -s /home/teamcity/nbs.main.database.yml config/database.yml"
    system "rake nbs:refresh_test_db RAILS_ENV=test"
    system "cucumber --tags @m10,@m11,@selenium --format junit --out tmp/cucumber-junit"
  end

end