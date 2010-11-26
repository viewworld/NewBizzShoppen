namespace :teamcity do

  desc "run cucumber tests"
  task :cucumber do
    system "cucumber --tags @m1,@m2 --format junit --out tmp/cucumber-junit"
  end

end