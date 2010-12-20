When /^invoice exists for user "([^"]*)"(?: with attributes "([^"]*)")?$/ do |email,options|
  unless user = User.where(:email => email).first
    And %{I am signed up and confirmed as user with email #{email} and password secret and role customer}
    user = User.where(:email => email).first
  end
  attrs = options ? Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(:user => user) : {:user => user}
  Invoice.make!(attrs)
end

When /^invoice line for first invoice exists for user "([^"]*)"(?: with attributes "([^"]*)")?$/ do |email,options|
  invoice = User.where(:email => email).first.invoices.first
  attrs = options ? Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(:invoice => invoice) : {:invoice => invoice}
  InvoiceLine.make!(attrs)
end

When /^first invoice for user "([^"]*)" is created at "([^"]*)"$/ do |email, date|
  invoice = User.where(:email => email).first.invoices.first
  Invoice.update_all(["created_at = :date, sale_date = :date",{:date => date}], ["id=?",invoice.id])
end

When /^first invoice for user "([^"]*)" is paid$/ do |email|
  invoice = User.where(:email => email).first.invoices.first
  Invoice.update_all(["paid_at = :date",{:date => Time.now}], ["id=?",invoice.id])
end
