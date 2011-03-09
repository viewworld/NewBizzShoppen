Given /^there are no hints$/ do
  Article::Cms::Hint.delete_all
end
When /^article hint for model "([^"]*)" and method "([^"]*)" exists$/ do |model, method|
  hint = Article::Cms::Hint.find_by_key("#{model.downcase}_#{method}")
  Article::Cms::Hint.make!(:key => "#{model.downcase}_#{method}", :published => true) if hint.nil?
end
When /^article hint for model "([^"]*)" and method "([^"]*)" has attributes "([^"]*)"$/ do |model, method, options|
  hint = Article::Cms::Hint.find_by_key("#{model.downcase}_#{method}")
  hint = Article::Cms::Hint.make!(:key => "#{model.downcase}_#{method}", :published => true) if hint.nil?
  hint.update_attributes(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end