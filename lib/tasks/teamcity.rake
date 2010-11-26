namespace :teamcity do

  desc "run cucumber tests"
  task :cucumber do
    system "rake db:migrate"
    system "rake db:seed"
    system "cucumber --tags @m1,@m2"
  end

end