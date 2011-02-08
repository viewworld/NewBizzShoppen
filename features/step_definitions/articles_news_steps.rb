Given /^agent news exists with attributes "([^"]*)"$/ do |options|
  Article::News::Agent.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

When /^there are (\d+) agent news/ do |num|
  num.to_i.times do
    Article::News::Agent.make!.publish!
  end
end

When /^there are (\d+) purchase manager news/ do |num|
  num.to_i.times do
    Article::News::Agent.make!.publish!
  end
end

When /^there are (\d+) buyer news/ do |num|
  num.to_i.times do
    Article::News::SalesManager.make!.publish!
  end
end

Given /^published agent news exists with attributes "([^"]*)"$/ do |options|
  Article::News::Agent.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys).publish!
end

Given /^published buyer news exists with attributes "([^"]*)"$/ do |options|
  Article::News::SalesManager.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys).publish!
end

Given /^published purchase manager news exists with attributes "([^"]*)"$/ do |options|
  Article::News::PurchaseManager.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys).publish!
end

Given /^pagination page size for news is set to (\d+)$/ do |n|
  Settings.stubs(:default_news_per_page).returns(n)
end

When /^there is a published news for category "([^"]*)"$/ do |category_name|
  Article::News::CategoryHome.make!(:resource => Category.where(:name => category_name).first).publish!
end


