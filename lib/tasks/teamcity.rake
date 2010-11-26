namespace :teamcity do

  desc "run cucumber tests"
  task :cucumber do
    system "rake nbs:refresh_test_db"
    system "cucumber --tags @m1,@m2"
  end

end