When /^there is a seller(?: with attributes "([^"]*)")(?: for country "([^"]*)")?$/ do |options,country_name|
  country = country_name ? Country.where(:name => country_name).first : Country.make!
  attrs = options ? Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys : {}
  attrs.merge!(:address => Address.make!(:country => country))
  Seller.make!(attrs)
end

When /^invoice exists for user "([^"]*)"(?: with attributes "([^"]*)")?$/ do |email,options|
  attrs = options ? Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(:user => User.where(:email => email).first) : {:user => User.where(:email => email).first}
  attrs.merge!(:seller => Seller.make!)
  Invoice.make!(attrs)
end

Given /^seller "([^"]*)" has address "([^"]*)"$/ do |company_name,options|
  seller = Seller.where(:company_name => company_name).first
  attrs = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  seller.address.update_attributes(attrs)
end