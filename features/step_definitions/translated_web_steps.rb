Then /^I should see translated "([^"]*)"$/ do |key|
  %{I should see "#{I18n.t(key)}"}
end

When /^I press translated "([^"]*)"$/ do |key|
  %{I press #{I18n.t(key)}}
end
