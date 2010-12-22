When /^invoice exists for user "([^"]*)"$/ do |email|
  Invoice.make!(:user => User.where(:email => email).first)
end

Then /^invoice is created for user with email "([^"]*)" and role "([^"]*)"$/ do |email, role|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  assert customer.invoices.last.created_at.to_date == Date.today
end

Then /^invoice line is created for lead "([^"]*)" and user with email "([^"]*)" and role "([^"]*)"$/ do |header, email, role|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  lead = Lead.find_by_header(header).first
  assert !customer.invoices.last.invoice_lines.detect { |il| il.payable.lead == lead }.nil?
end

Then /^invoices count for user with email "([^"]*)" and role "([^"]*)" is (\d+)$/ do |email, role, count|
  customer = "User::#{role.camelize}".constantize.find_by_email(email)
  assert customer.invoices.size == count.to_i
end