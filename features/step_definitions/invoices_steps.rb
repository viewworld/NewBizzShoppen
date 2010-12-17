When /^invoice exists for user "([^"]*)"$/ do |email|
  Invoice.make!(:user => User.where(:email => email).first)
end