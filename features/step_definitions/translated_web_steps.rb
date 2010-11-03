Then /^I should see translated "([^"]*)"$/ do |key|
  I18n.locale = :en
  Then %{I should see "#{I18n.t(key)}"}
end

When /^I press translated "([^"]*)"$/ do |key|
  I18n.locale = :en
  Then %{I press "#{I18n.t(key)}"}
end

Then /^I should not see translated "([^"]*)"$/ do |key|
  I18n.locale = :en
  Then %{I should not see "#{I18n.t(key)}"}
end


#TODO - Add "within" capability
Given /^I follow translated "([^"]*)"$/ do |key|
  I18n.locale = :en
  Then %{I follow "#{I18n.t(key)}"}
end

Given /^I follow translated logout link for (.+)$/ do |email|
   Then %{I follow "#{I18n.t('layout.logout_link', :user_email => email)}"}
end
