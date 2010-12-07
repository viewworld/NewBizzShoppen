Given /^news exists with attributes "([^"]*)"$/ do |options|
  Article::News.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

When /^there are (\d+) random news/ do |num|
  num.to_i.times do
    Article::News.make!.publish!
  end
end

When /^there are (\d+) agent news/ do |num|
  num.to_i.times do
    Article::News.make!(:scope => Article::News::AGENT).publish!
  end
end

When /^there are (\d+) buyer news/ do |num|
  num.to_i.times do
    Article::News.make!(:scope => Article::News::BUYER).publish!
  end
end

Given /^published agent news exists with attributes "([^"]*)"$/ do |options|
  Article::News.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(:scope => 0)).publish!
end

Given /^published buyer news exists with attributes "([^"]*)"$/ do |options|
  Article::News.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(:scope => 1)).publish!
end

Given /^pagination page size for news is set to (\d+)$/ do |n|
  Settings.stubs(:default_news_per_page).returns(n)
end

