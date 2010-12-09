When /^currency with name "([^"]*)" exists$/ do |currency_name|
  Currency.make!(:name => currency_name)
end

When /^I delete "([^"]*)" currency$/ do |currency_name|
  currency = Currency.where(:name => currency_name).first
  And %{I click hidden translated link "administration.currencies.index.view.delete" within "#currency_#{currency.id}"}
end

