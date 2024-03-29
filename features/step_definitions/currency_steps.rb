When /^currency with name "([^"]*)" exists$/ do |currency_name|
  Currency.make!(:name => currency_name)
end

When /^I delete "([^"]*)" currency$/ do |currency_name|
  currency = Currency.where(:name => currency_name).first
  And %{I click hidden translated link "administration.currencies.index.view.delete" within "#currency_#{currency.id}"}
end

When /^lead "([^"]*)" has currency "([^"]*)"$/ do |lead_header, currency_name|
  lead = Lead.where(:header => lead_header).first
  lead = Lead.make!(:header => lead_header) if lead.nil?
  currency = Currency.where(:name => currency_name).first
  lead.currency = currency
  lead.save
end

Given /^currency "([^"]*)" exists with attributes "([^"]*)"$/ do |currency_name, options|
  currency = Currency.where(:name => currency_name).first
  currency.update_attributes(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

When /^all prices are converted to euro$/ do
  LeadPurchase.all.each do |purchase|
    purchase.send(:set_euro_price)
    purchase.save
  end
end