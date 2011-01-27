Given /^there is a bank account for country "([^"]*)"(?: with attributes "([^"]*)")?$/ do |country_name,options|
  country = Country.where(:name => country_name).first
  attrs = options ? Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys : {}
  attrs.merge!(:country => country)
  BankAccount.make!(attrs)
end

