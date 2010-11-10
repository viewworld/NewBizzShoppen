Then /^I should see translated "([^"]*)"(?: with options "([^"]*)")?$/ do |key, options|

  I18n.locale = :en
  if options.present?
    options = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  Then %{I should see "#{I18n.t(key, options)}"}
    else
  Then %{I should see "#{I18n.t(key)}"}
    end
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

Given /^I select translated "([^"]*)" from "([^"]*)"$/ do |key, field|
  I18n.locale = :en
  Then %{I select "#{I18n.t(key)}" from "#{field}"}
end
