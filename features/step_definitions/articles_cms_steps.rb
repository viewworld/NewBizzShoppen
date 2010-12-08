Given /^main page article exists with attributes "([^"]*)"$/ do |options|
  Article::Cms.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(:scope => 0))
end

Given /^interface content text exists with attributes "([^"]*)"$/ do |options|
  Article::Cms.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(:scope => 1))
end

Given /^help popup exists with attributes "([^"]*)"$/ do |options|
  Article::Cms.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(:scope => 2))
end

When /^there are (\d+) random cms articles$/ do |num|
  num.to_i.times do
    Article::Cms.make!(:key => ActiveSupport::SecureRandom.hex(16))
  end
end
