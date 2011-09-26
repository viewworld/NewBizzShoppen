# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a 
# newer version of cucumber-rails. Consider adding your own code to a new file 
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.


require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

TIMEOUT = 10

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

When /^I open page in browser$/ do
save_and_open_page
end

When /^I refresh page$/ do
reload
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )press "([^"]*)"(?: within "([^"]*)")?$/ do |button, selector|
  with_scope(selector) do
    click_button(button)
  end
end

When /^(?:|I )follow "([^"]*)"(?: within "([^"]*)")?$/ do |link, selector|
  with_scope(selector) do
    click_link(link)
  end
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"(?: within "([^"]*)")?$/ do |field, value, selector|
  with_scope(selector) do
    fill_in(field, :with => value)
  end
end

When /^(?:|I )fill in translated "([^"]*)" with "([^"]*)"(?: within "([^"]*)")?$/ do |field, value, selector|
  with_scope(selector) do
    fill_in(I18n.t(field), :with => value)
  end
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"(?: within "([^"]*)")?$/ do |value, field, selector|
  with_scope(selector) do
    fill_in(field, :with => value)
  end
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# TODO: Add support for checkbox, select og option
# based on naming conventions.
#
When /^(?:|I )fill in the following(?: within "([^"]*)")?:$/ do |selector, fields|
  with_scope(selector) do
    fields.rows_hash.each do |name, value|
      When %{I fill in "#{name}" with "#{value}"}
    end
  end
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"(?: within "([^"]*)")?$/ do |value, field, selector|
  with_scope(selector) do
    select(value, :from => field)
  end
end

When /^(?:|I )check "([^"]*)"(?: within "([^"]*)")?$/ do |field, selector|
  with_scope(selector) do
    check(field)
  end
end

When /^(?:|I )check translated "([^"]*)"(?: within "([^"]*)")?$/ do |field, selector|
  with_scope(selector) do
    check(I18n.t(field))
  end
end

When /^(?:|I )uncheck "([^"]*)"(?: within "([^"]*)")?$/ do |field, selector|
  with_scope(selector) do
    uncheck(field)
  end
end

When /^(?:|I )uncheck translated "([^"]*)"(?: within "([^"]*)")?$/ do |field, selector|
  with_scope(selector) do
    uncheck(I18n.t(field))
  end
end

When /^(?:|I )choose "([^"]*)"(?: within "([^"]*)")?$/ do |field, selector|
  with_scope(selector) do
    choose(field)
  end
end

When /^(?:| )attach the file "([^\"]*)" to "([^\"]*)"(?: within "([^\"]*)")?$/ do |path, field, selector|
  with_scope(selector) do
    attach_file(field, path_to(path))
  end
end

Then /^(?:|I )should see JSON:$/ do |expected_json|
  require 'json'
  expected = JSON.pretty_generate(JSON.parse(expected_json))
  actual   = JSON.pretty_generate(JSON.parse(response.body))
  expected.should == actual
end

Then /^(?:|I )should see "([^"]*)"(?: within "([^"]*)")?$/ do |text, selector|
  with_scope(selector) do
    if page.respond_to? :should
      assert wait_until(TIMEOUT) { page.should have_content(text) }
    else
      assert wait_until(TIMEOUT) { assert page.has_content?(text) }
    end
  end
end

Then /^(?:|I )should see \/([^\/]*)\/(?: within "([^"]*)")?$/ do |regexp, selector|
  regexp = Regexp.new(regexp)
  with_scope(selector) do
    if page.respond_to? :should
      assert wait_until(TIMEOUT) { page.should have_xpath('//*', :text => regexp) }
    else
      assert wait_until(TIMEOUT) { assert page.has_xpath?('//*', :text => regexp) }
    end
  end
end

Then /^(?:|I )should not see "([^"]*)"(?: within "([^"]*)")?$/ do |text, selector|
  with_scope(selector) do
    if page.respond_to? :should
      assert wait_until(TIMEOUT) { page.should have_no_content(text) }
    else
      assert wait_until(TIMEOUT) { assert page.has_no_content?(text) }
    end
  end
end

Then /^(?:|I )should not see \/([^\/]*)\/(?: within "([^"]*)")?$/ do |regexp, selector|
  regexp = Regexp.new(regexp)
  with_scope(selector) do
    if page.respond_to? :should
      assert wait_until(TIMEOUT) { page.should have_no_xpath('//*', :text => regexp) }
    else
      assert wait_until(TIMEOUT) { assert page.has_no_xpath?('//*', :text => regexp) }
    end
  end
end

Then /^the "([^"]*)" field(?: within "([^"]*)")? should contain "([^"]*)"$/ do |field, selector, value|
  with_scope(selector) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if field_value.respond_to? :should
      field_value.should =~ /#{value}/
    else
      assert_match(/#{value}/, field_value)
    end
  end
end

Then /^the "([^"]*)" field(?: within "([^"]*)")? should contain any value$/ do |field, selector|
  with_scope(selector) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if field_value.respond_to? :should
      field_value.should =~ /.*/
    else
      assert_match(/.*/, field_value)
    end
  end
end

Then /^the "([^"]*)" field(?: within "([^"]*)")? should not contain "([^"]*)"$/ do |field, selector, value|
  with_scope(selector) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if field_value.respond_to? :should_not
      assert wait_until(TIMEOUT) { field_value.should_not =~ /#{value}/ }
    else
      assert wait_until(TIMEOUT) { assert_no_match(/#{value}/, field_value) }
    end
  end
end

Then /^the "([^"]*)" checkbox(?: within "([^"]*)")? should be checked$/ do |label, selector|
  with_scope(selector) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_true
    else
      assert field_checked
    end
  end
end

Then /^the "([^"]*)" checkbox(?: within "([^"]*)")? should not be checked$/ do |label, selector|
  with_scope(selector) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_false
    else
      assert !field_checked
    end
  end
end
 
Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^(?:|I )should have the following query string:$/ do |expected_pairs|
  query = URI.parse(current_url).query
  actual_params = query ? CGI.parse(query) : {}
  expected_params = {}
  expected_pairs.rows_hash.each_pair{|k,v| expected_params[k] = v.split(',')} 
  
  if actual_params.respond_to? :should
    actual_params.should == expected_params
  else
    assert_equal expected_params, actual_params
  end
end

Then /^show me the page$/ do
  save_and_open_page
end

Given /^I make sure current locale is "([^"]*)"$/ do |locale|
  visit "/locales/#{locale}"
end

Then /^locale should be set to "([^"]*)"$/ do |locale|
  I18n.locale.should == locale.to_sym
end

Then /^The flash message should be set to translated "([^"]*)"$/ do |key|
  assert page.body.match(I18n.t(key))
end

# does not work well with selenium
Then /^"([^"]*)" should be selected for "([^"]*)"(?: within "([^"]*)")?$/ do |field, value, selector|
  with_scope(selector) do
    find_field(field).value.should =~ /#{value}/
  end
end

# does not work well with selenium
Then /^"([^"]*)" should be selected for translated "([^"]*)"(?: within "([^"]*)")?$/ do |field, key, selector|
  with_scope(selector) do
    find_field(field).value.should =~ /#{I18n.t(key)}/
  end
end

Then /^select with id "([^"]*)" should be selected for "([^"]*)" within "([^"]*)"$/ do |id, value, selector|
  page.find("#{selector} select[id='#{id}'] option[selected]").text.should =~ /#{value}/
end

Then /^select with id "([^"]*)" should be selected for translated "([^"]*)" within "([^"]*)"$/ do |id, value, selector|
  page.find("#{selector} select[id='#{id}'] option[selected]").text.should =~ /#{I18n.t(value)}/
end

Then /^"([^"]*)" should be selected for value "([^"]*)"$/ do |field, value|
  assert page.has_xpath?("//select[@id='#{field}'] //option[@selected = 'selected' and contains(string(), '#{value}')]")
end

Then /^I should not see field "([^"]*)"$/ do |field|
  assert !page.has_xpath?("//*[(@id = '#{field}')]")
end

Then /^I run javascript (.+)$/ do |js_code|
  page.evaluate_script(js_code)
end

Then /^I evaluate javascript "([^"]*)"$/ do |js_code|
  page.evaluate_script(js_code)
end

Then /^I fill in hidden field "([^"]*)" with "([^"]*)"$/ do |field, value|
  page.evaluate_script("document.getElementById('#{field}').value = '#{value}'")
end

Then /^I should see "([^"]*)" items on a list(?: within "([^"]*)")?$/ do |number, selector|
  with_scope(selector) do
    page.all(:css, 'li').size.should eql(number.to_i)
  end
end

Then /^I should see "([^"]*)" first on a list(?: within "([^"]*)")?$/ do |text, selector|
  with_scope(selector) do
    page.all(:css, 'li').first.text.should =~ /#{text}/
  end
end

Then /^I should see "([^"]*)" before "([^"]*)"$/ do |first,second|
  page.body.should =~ /#{first}.*#{second}/m
end

Then /^I should see "([^"]*)" rows in a table with headers(?: within "([^"]*)")?$/ do |number, selector|
  with_scope(selector) do
    # +2 for headers
    page.all(:css, 'tr').size.should eql(number.to_i+2)
  end
end

Then /^I should see "([^"]*)" rows in a table(?: within "([^"]*)")?$/ do |number, selector|
  with_scope(selector) do
    page.all(:css, 'tr').size.should eql(number.to_i)
  end
end

Then /^I should see "([^"]*)" div blocks with class like "([^"]*)"(?: within "([^"]*)")?$/ do |number, css_class, selector|
  with_scope(selector) do
    page.all(:css, "div[class*='#{css_class}']").size.should eql(number.to_i)
  end
end

Then /^I should see "([^"]*)" rows with id like "([^"]*)" in a table(?: within "([^"]*)")?$/ do |number, id, selector|
  with_scope(selector) do
    page.all(:css, "tr[id*='#{id}']").size.should eql(number.to_i)
  end
end

Then /^"([^"]*)" dropdown should have values "([^"]*)"$/ do |field, values|
  values.split(",").each do |value|
    assert page.has_xpath?("//select[@id='#{field}'] //option[contains(string(), '#{value}')]")
  end
end

Then /^"([^"]*)" dropdown should not have values "([^"]*)"$/ do |field, values|
  values.split(",").each do |value|
    assert !page.has_xpath?("//select[@id='#{field}'] //option[contains(string(), '#{value}')]")
  end
end

When /^I visit URL "([^"]*)"$/ do |url|
  visit url
end

Then /^I should see CSS path "([^"]*)"$/ do |selector|
  page.all(:css, selector).size.should eql(1)
end

Then /^I should see "([^"]*)" elements within CSS path "([^"]*)"$/ do |number,selector|
  page.all(:css, selector).size.should eql(number.to_i)
end

Then /^I should not see CSS path "([^"]*)"$/ do |selector|
  page.all(:css, selector).size.should eql(0)
end

Given /^browser accepts "([^"]*)" locale$/ do |locale|
  page.driver.header "Accept-Language", locale
end

Given /^I clear cookies/ do
  page.driver.clear_cookies
end

Given /^I reset page/ do
  page.driver.reset!
end

When /^I visit domain "([^\"]*)"$/ do |domain_name|
  Capybara.default_host = domain_name
end

When /^I set referer to "([^\"]*)"$/ do |referer|
  page.driver.header "HTTP_REFERER", referer
end

Then /^element is visible "([^\"]*)"(?: within "([^\"]*)")?$/ do |element, selector|
  with_scope(selector) do
    assert wait_until(TIMEOUT) { assert page.find(element).visible? }
  end
end

Then /^element is not visible "([^\"]*)"(?: within "([^\"]*)")?$/ do |element, selector|
  with_scope(selector) do
    assert wait_until(TIMEOUT) { assert (not page.find(element).visible?) }
  end
end

Then /^I should see "([^"]*)" occurrences of css class "([^"]*)" for tag "([^"]*)"(?: witihin "([^"]*)")?$/ do |number, css_class, tag_name, selector|
  with_scope(selector) do
    page.all(:css, "#{tag_name}[class*='#{css_class}']").size.should eql(number.to_i)
  end
end

Then /^select "([^"]*)" should have option "([^"]*)" disabled$/ do |id, name|
  page.find("select[id='#{id}'] option[disabled]").text.should =~ /#{name}/
end

Given /^I visit domain (.+)$/ do |domain|
  Capybara.default_host = domain #for Rack::Test
  Capybara.app_host = "#{domain}:#{current_url.split(":").last.to_s.split("/").first}" if Capybara.current_driver == :selenium
  if domain.include?("fairdeals")
    visit("/fairdeals")
  else
    visit(Capybara.app_host)
  end
end