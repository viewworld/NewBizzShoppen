When /^VAT rate for "([^"]*)" is set to "([^"]*)"$/ do |country_name, value|
  country = Country.where(:name => country_name).first
  VatRate.create(:country => country, :rate => value)
end
