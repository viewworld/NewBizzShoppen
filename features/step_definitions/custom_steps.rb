And /^I wait (.*) second$/ do |n|
  sleep n.to_i
end

Given /^Category (.+) is created$/ do |name|
  Category.create(:name => name)
end

Given /^Country (.+) is created$/ do |name|
  Country.create(:name => name)
end

Given /^I run ruby "([^\"]*)"$/ do |ruby|
print "result of: #{ruby}\n\n"
eval ruby
print "\n\n"
end

Then /^I should have value "([^"]*)" in the css path "([^"]*)"$/ do |value, css_path|
   assert page.find(css_path).text == value
end

Then /^I should have value "([^"]*)" in the xpath path "([^"]*)"$/ do |value, xpath|
  assert page.find(:xpath, xpath).text == value
end

Given /^pagination per page size in model (.+) is set to (\d+)$/ do |model_name, n|
  model_name.constantize.stubs(:per_page).returns(n)
end

Given /^email "([^"]*)" has translation for lang "([^"]*)" with attributes "([^"]*)"$/ do |email_unique_id, locale_lang, options|
  I18n.locale = :en
  email_template = EmailTemplate.find_by_uniq_id(email_unique_id)
  if email_template.email_template_translations.select{ |ett| ett.locale == locale_lang }.blank?
    email_translation = EmailTranslation.create(:email_template => email_template, :locale => locale_lang)
  else
    email_translation = email_template.email_template_translations.detect{ |ett| ett.locale == locale_lang }
  end
  email_translation.update_attributes(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

When /^confirmation email is sent for locale "([^"]*)"$/ do |locale_lang|
  I18n.locale = locale_lang.to_sym
  User::Agent.make!
end

Then /^last email sent should have content "([^"]*)"$/ do |content|
  assert ActionMailer::Base.deliveries.last.body.raw_source.include?(content)
end

Then /^last email sent should have been sent to recipient "([^"]*)"$/ do |email|
  assert ActionMailer::Base.deliveries.last.to.include?(email)
end

Given /^I click hidden link "([^"]*)"(?: within "([^"]*)")?$/ do |caption,selector|
  if selector
    page.all(:css, "#{selector} a").detect { |l| l.text == caption }.click()
  else
    page.all(:css, 'a').detect { |l| l.text == caption }.click()
  end
end

Given /^I click hidden link url "([^"]*)"$/ do |url|
  page.all(:css, 'a').detect { |l| l.text == caption }.click()
end

Given /^I click hidden link by url regex "([^"]*)"$/ do |regex|
  visit page.all(:css, 'a').detect { |l| !(l[:href] =~ eval(regex)).nil? }[:href]
end
