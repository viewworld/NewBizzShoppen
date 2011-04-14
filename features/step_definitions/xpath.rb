Then /^I click xpath "([^\"]*)"$/ do |locator|
  page.find(:xpath, locator).click
end