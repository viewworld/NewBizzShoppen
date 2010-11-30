Given /^news exists with attributes "([^"]*)"$/ do |options|
  Article::News.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

When /^there are (\d+) random news/ do |num|
  num.to_i.times do
    Article::News.make!
  end
end

Given /^agent news exists with attributes "([^"]*)"$/ do |options|
  Article::News.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(:scope => 0))
end

Given /^buyer news exists with attributes "([^"]*)"$/ do |options|
  Article::News.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(:scope => 1))
end
