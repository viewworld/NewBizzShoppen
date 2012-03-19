Given /^there are "([^"]*)" chain mail types$/ do |num|
  num.to_i.times { ChainMailType.make! }
end
