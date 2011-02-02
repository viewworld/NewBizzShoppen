Given /^main page article exists with attributes "([^"]*)"$/ do |options|
  Article::Cms::MainPageArticle.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

Given /^interface content text exists with attributes "([^"]*)"$/ do |options|
  Article::Cms::InterfaceContentText.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

Given /^help popup exists with attributes "([^"]*)"$/ do |options|
  Article::Cms::HelpPopup.make!(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

When /^there are (\d+) main page articles$/ do |num|
  num.to_i.times do
    Article::Cms::MainPageArticle.make!(:key => ActiveSupport::SecureRandom.hex(16))
  end
end

When /^there are (\d+) interface content texts$/ do |num|
  num.to_i.times do
    Article::Cms::InterfaceContentText.make!(:key => ActiveSupport::SecureRandom.hex(16))
  end
end

When /^there are (\d+) help popups$/ do |num|
  num.to_i.times do
    Article::Cms::HelpPopup.make!(:key => ActiveSupport::SecureRandom.hex(16))
  end
end
