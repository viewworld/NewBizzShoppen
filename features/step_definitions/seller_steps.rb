When /^a seller exists with attributes "([^"]*)"$/ do |options|
  attrs = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  Seller.make!(attrs)
end

When /^invoice exists for user "([^"]*)"(?: with attributes "([^"]*)")?$/ do |email,options|
  attrs = options ? Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(:user => User.where(:email => email).first) : {:user => User.where(:email => email).first}
  attrs.merge!(:seller => Seller.make!)
  Invoice.make!(attrs)
end
