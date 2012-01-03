And /^I wait (.*) second$/ do |n|
  sleep n.to_i
end

Given /^Category (.+) is created$/ do |name|
  currency = Currency.make!
  LeadCategory.create!(:name => name, :currency => currency)
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
    email_translation = EmailTemplateTranslation.create(:email_template_id => email_template.id, :locale => locale_lang)
  else
    email_translation = email_template.email_template_translations.detect{ |ett| ett.locale == locale_lang }
  end
  email_translation.update_attributes(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

When /^confirmation email is sent for locale "([^"]*)"$/ do |locale_lang|
  I18n.locale = locale_lang.to_sym
  User::Agent.make!(:address => Address.make(:country => Country.where(:locale => locale_lang).first))
end

Then /^last email sent should have subject "([^"]*)"$/ do |content|
  assert ActionMailer::Base.deliveries.last.subject.include?(content)
end

Then /^last email sent should have content "([^"]*)"$/ do |content|
  assert ActionMailer::Base.deliveries.last.body.raw_source.include?(content)
end

Then /^last email sent should have been sent to recipient "([^"]*)"$/ do |email|
  assert ActionMailer::Base.deliveries.last.to.include?(email)
end

Then /^last email sent should have been sent to cc "([^"]*)"$/ do |email|
  assert ActionMailer::Base.deliveries.last.cc.include?(email)
end

Then /^last "([^"]*)" emails should be sent to recipients "([^"]*)"$/ do |count, recipients|
  emails = ActionMailer::Base.deliveries.last(count.to_i)
  recipients.split(",").each do |recipient|
    assert emails.map(&:to).flatten.include?(recipient)
  end
end

Then /^no email has been send$/ do
  assert ActionMailer::Base.deliveries.empty? == true
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

Given /^I click hidden link by url regex "([^"]*)"(?: within "([^"]*)")?$/ do |regex,scope|
  selector = "a"
  selector = scope + " #{selector}" if scope
  visit page.all(:css, selector).detect { |l| !(l[:href] =~ eval(regex)).nil? }[:href]
end

Given /^I really click hidden link by url regex "([^"]*)"(?: within "([^"]*)")?$/ do |regex,scope|
  selector = "a"
  selector = scope + " #{selector}" if scope
  page.all(:css, selector).detect { |l| !(l[:href] =~ eval(regex)).nil? }.click()
end

Given /^I (should not|should) see link with label "([^"]*)"$/ do |should_be_visible, label|
  if should_be_visible == "should"
    assert !page.all(:css, 'a').detect { |l| l.text == label }.nil?
  else
    assert page.all(:css, 'a').detect { |l| l.text == label }.nil?
  end
end

When /^I fill in the last field with id like "([^"]*)" with "([^"]*)"(?: within "([^"]*)")?$/ do |id_like, val,selector|
  page.all(:css, "#{selector} input:last-of-type[id*='#{id_like}']").first.set(val)
end

Then /^checkbox with name like "([^"]*)" should be checked in the "([^"]*)" row of table "([^"]*)"$/ do |cb_name, row_num, table_selector|
  page.all(:css, "#{table_selector} tr:nth-of-type(#{row_num}) input[name*='#{cb_name}']").first['checked'].should eql(true)
end

Then /^checkbox with name like "([^"]*)" should not be checked in the "([^"]*)" row of table "([^"]*)"$/ do |cb_name, row_num, table_selector|
  page.all(:css, "#{table_selector} tr:nth-of-type(#{row_num}) input[name*='#{cb_name}']").first['checked'].should eql(false)
end

Then /^the "([^"]*)" field with id like "([^"]*)" should contain "([^"]*)"$/ do |num,id_like,val|
  page.all(:css, "input:nth-of-type(#{num})[id*='#{id_like}']").first['value'].should eql(val)
end

Then /^at least one text field with id like "([^"]*)" should contain value "([^"]*)"$/ do |id_like, val|
  page.all(:css, "input[id*='#{id_like}']").detect { |i| i['value'] == val}.should_not be_nil
end

Then /^I should see "([^"]*)" in the "([^"]*)" row of table "([^"]*)"$/ do |text, row_num, table_selector|
  page.all(:css, "#{table_selector} tr:nth-of-type(#{row_num})").first.text.should match(/#{text}/)
end

Then /^I should not see "([^"]*)" in the "([^"]*)" row of table "([^"]*)"$/ do |text, row_num, table_selector|
  page.all(:css, "#{table_selector} tr:nth-of-type(#{row_num})").first.text.should_not match(/#{text}/)
end

Then /^I should see translated "([^"]*)" in the "([^"]*)" row of table "([^"]*)"$/ do |key, row_num, table_selector|
  I18n.locale = :en
  Then %{I should see "#{I18n.t(key)}" in the "#{row_num}" row of table "#{table_selector}"}
end

Then /^I should not see translated "([^"]*)" in the "([^"]*)" row of table "([^"]*)"$/ do |key, row_num, table_selector|
  I18n.locale = :en
  Then %{I should not see "#{I18n.t(key)}" in the "#{row_num}" row of table "#{table_selector}"}
end

Then /^checkbox named "([^"]*)" should (be|not be) checked$/ do |cb_name, is_checked|
  page.all(:css, "input[id*='#{cb_name}']").first['checked'].should eql(is_checked == "be")
end

Given /^I fill in "([^"]*)" with date that is "([^"]*)" days from now$/ do |field_name, days|
  And %{I fill in "#{field_name}" with "#{(Date.today+days.to_i.days).to_s}"}
end

Given /^field "([^"]*)" is of textarea type(?: within "([^"]*)")?$/ do |field_name, selector|
  with_scope(selector) do
    field = find_field(field_name)
    assert field.tag_name == 'textarea'
  end
end

Given /^I move mouse over "([^"]*)"$/ do |selector|
  page.evaluate_script("move_mouse_over('#{selector}')")
end

Given /^I show accordion details for row "([^"]*)"$/ do |selector|
  And %{I follow translated "lead_purchases.listing.show_row" within "#{selector}"}
end

Given /^I show accordion comments details for row "([^"]*)"$/ do |selector|
  And %{I follow translated "lead_purchases.listing.show_row" within "#{selector}"}
end

Given /^user with email "([^"]*)" has login key generated$/ do |email|
  user = User.find_by_email(email)
  user.generate_login_key!
end

When /^I login as user with email "([^"]*)" using login key$/ do |email|
  user = User.find_by_email(email)
  visit "/login_keys/?key=#{user.login_key}"
end

Given /^I follow(| translated) action "([^\"]*)" within row containing(| translated) "([^\"]*)"$/ do |is_action_translated, action, is_text_translated, text|
  I18n.locale = :en
  action = I18n.t(action) if is_action_translated == " translated"
  text = I18n.t(text) if is_text_translated == " translated"
  page.execute_script("$('div.td_actions ul').show()")
  page.find(:xpath, "//td[contains(., '#{text}')]/..//a[contains(., '#{action}')]").click()
end

Given /^date today is "([^"]*)"$/ do |date|
  Date.stubs(:today).returns(Date.parse(date))
end

Given /^class "([^"]*)" method "([^"]*)" returns "([^"]*)"$/ do |klass, method, arg|
    klass.constantize.stubs(method.to_sym).returns(arg)
end

def options_hash_to_s(options)
  options.to_a.map{|pair| pair.join(":")}.join(",")
end

def options_s_to_hash(options)
  Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys  
end