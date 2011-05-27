When /^setting for "([^"]*)" is set to "([^"]*)"$/ do |name, value|
  Settings.stubs(name.to_sym).returns(value)
end
