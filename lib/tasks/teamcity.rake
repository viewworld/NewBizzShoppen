namespace :teamcity do

  desc "run cucumber tests"
  task :cucumber do
    system "RAILS_ENV=test rake db:migrate"
    system "RAILS_ENV=test rake db:seed"
    system "cucumber --tags @m1,@m2"
  end

end