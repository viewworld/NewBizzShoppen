When /^VAT rate for "([^"]*)" is set to "([^"]*)"$/ do |country_name, value|
  country = Country.where(:name => country_name).first
  if country.vat_rate
    country.vat_rate.update_attribute(:rate, value)
  else
    VatRate.create(:country_id => country.id, :rate => value)
  end
end

Then /^country "([^"]*)" should have VAT rate of "([^"]*)"$/ do |country_name, vat_rate|
  Country.where(:name => country_name).first.vat_rate.rate.should eql(BigDecimal(vat_rate))
end

