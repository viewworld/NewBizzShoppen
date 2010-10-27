Then /^I should see translated "([^"]*)"$/ do |key|
  Then %{I should see "#{I18n.t(key)}"}
end

When /^I press translated "([^"]*)"$/ do |key|
  Then %{I press "#{I18n.t(key)}"}
end

Then /^I should not see translated "([^"]*)"$/ do |key|
  Then %{I should not see "#{I18n.t(key)}"}
end

