Given /^there is a bank account for country "([^"]*)"(?: with attributes "([^"]*)")?$/ do |country_name,options|
  country = Country.where(:name => country_name).first
  attrs = options ? Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys : {}
  attrs.merge!(:country => country)
  BankAccount.make!(attrs)
end

Then /^checkbox with name like "([^"]*)" should be checked in the "([^"]*)" row of table "([^"]*)"$/ do |cb_name, row_num, table_selector|
  page.all(:css, "#{table_selector} tr:nth-of-type(#{row_num}) input[name*='#{cb_name}']").first['checked'].should eql(true)
end

Then /^checkbox with name like "([^"]*)" should not be checked in the "([^"]*)" row of table "([^"]*)"$/ do |cb_name, row_num, table_selector|
  page.all(:css, "#{table_selector} tr:nth-of-type(#{row_num}) input[name*='#{cb_name}']").first['checked'].should eql(false)
end
