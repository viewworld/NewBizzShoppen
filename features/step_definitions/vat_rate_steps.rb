When /^VAT rate for "([^"]*)" is set to "([^"]*)"$/ do |country_name, value|
  country = Country.where(:name => country_name).first
  VatRate.create(:country => country, :rate => value)
end

Then /^country "([^"]*)" should have VAT rate of "([^"]*)"$/ do |country_name, vat_rate|
  Country.where(:name => country_name).first.vat_rate.rate.should eql(BigDecimal(vat_rate))
end

