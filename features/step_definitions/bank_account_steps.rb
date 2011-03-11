Given /^there is a bank account for country "([^"]*)"(?: with attributes "([^"]*)")?$/ do |country_name,options|
  country = Country.where(:name => country_name).first
  attrs = options ? Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys : {}
  attrs.merge!(:address => Address.make!(:country => country))
  BankAccount.make!(attrs)
end

When /^bank account for country "([^"]*)" has attributes "([^"]*)"$/ do |country, options|
  country_id = Country.where(:name => country).first.id
  bank_account = BankAccount.joins(:address).where("addresses.country_id = :country_id", {:country_id => country_id}).first
  attrs = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  bank_account = BankAccount.find(bank_account.id)
  bank_account.update_attributes(attrs)
end

