Then /^I should see translated "([^"]*)"(?: with options "([^"]*)")?$/ do |key, options|

  I18n.locale = :en
  if options.present?
    options = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
    localize_format = options.delete(:localize)
    options.each{ |k,v| options[k] = eval(v[/\{(.*?)\}/,1]) if v[/\{(.*?)\}/,1] }

    if localize_format
      options.each_pair do |k, v|
        if v.is_a?(Date)
          options[k] = I18n.l(v, :format => localize_format.to_sym)
        end
      end
    end

  Then %{I should see "#{I18n.t(key, options)}"}
    else
  Then %{I should see "#{I18n.t(key)}"}
    end
end

Then /^I should see translated "([^"]*)" within "([^"]*)"$/ do |key, selector|

  I18n.locale = :en
  if selector.present?
  Then %{I should see "#{I18n.t(key)}" within "#{selector}"}
    else
  Then %{I should see "#{I18n.t(key)}"}
    end
end

Then /^I should not see translated "([^"]*)" within "([^"]*)"$/ do |key, selector|

  I18n.locale = :en
  if selector.present?
  Then %{I should not see "#{I18n.t(key)}" within "#{selector}"}
    else
  Then %{I should not see "#{I18n.t(key)}"}
    end
end

Then /^I should not see translated "([^"]*)"(?: with options "([^"]*)")?$/ do |key, options|
  I18n.locale = :en
  if options.present?
    options = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  Then %{I should not see "#{I18n.t(key, options)}"}
    else
  Then %{I should not see "#{I18n.t(key)}"}
    end
end


When /^I press translated "([^"]*)"(?: within "([^"]*)")?$/ do |key,selector|
  I18n.locale = :en
  if selector.present?
    Then %{I press "#{I18n.t(key)}" within "#{selector}"}
  else
    Then %{I press "#{I18n.t(key)}"}
  end
end

Given /^I follow translated "([^"]*)"(?: within "([^"]*)")$/ do |key,selector|
  I18n.locale = :en
  with_scope(selector) do
    Then %{I follow "#{I18n.t(key)}"}
  end
end

Given /^I follow translated "([^"]*)"$/ do |key|
  I18n.locale = :en
  Then %{I follow "#{I18n.t(key)}"}
end

Given /^I follow translated logout link for (.+)$/ do |email|
   Then %{I follow "#{I18n.t('layout.logout_link', :user_email => email)}"}
end

When /^I select translated "([^"]*)" from "([^"]*)"(?: within "([^"]*)")?$/ do |key, field, selector|
  I18n.locale = :en
  if selector.present?
    Then %{I select "#{I18n.t(key)}" from "#{field}" within "#{selector}"}
  else
    Then %{I select "#{I18n.t(key)}" from "#{field}"}
  end
end

And /"([^"]*)" should be selected for value translated "([^"]*)"/ do |field, key|
  I18n.locale = :en
  Then %{"#{field}" should be selected for value "#{I18n.t(key)}"}
end

Then /^locale is set to "([^"]*)" for translation "([^"]*)"/ do |locale_lang, key|
  I18n.locale = locale_lang.to_sym
  Then %{I should see "#{I18n.t(key)}"}
end

Then /I should have translated value "([^"]*)" in the css path "([^"]*)"$/ do |key, css_path|
  I18n.locale = :en
  Then %{I should have value "#{I18n.t(key)}" in the css path "#{css_path}"}
end

Then /^I click hidden translated link "([^"]*)"(?: within "([^"]*)")?$/ do |key,selector|
  I18n.locale = :en
  if selector
    Then %{I click hidden link "#{I18n.t(key)}" within "#{selector}"}
  else
    Then %{I click hidden link "#{I18n.t(key)}"}
  end
end