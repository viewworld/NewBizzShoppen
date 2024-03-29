def add_tags_to_object(object, tags)
  tags = tags.split(",").map { |t| t.strip }
  tags.each do |tag|
    object.tag_list << tag
  end
  object.save
end

def check_tags_for_object(object, tags)
  tags = tags.split(",").map { |t| t.strip }
  tag_list = object.tag_list

  assert (tag_list - tags).size == tag_list.size - tags.size
end

When /^all contacts from campaign "([^"]*)" have tags "([^"]*)"$/ do |campaign_name, tags|
  Campaign.where(:name => campaign_name).first.contacts.each do |contact|
    add_tags_to_object(contact, tags)
  end
end

Given /^user with email "([^"]*)" has tags "([^"]*)"$/ do |email, tags|
  add_tags_to_object(User.where(:email => email).first.with_role, tags)
end

Given /^lead with header "([^"]*)" has tags "([^"]*)"$/ do |header, tags|
  add_tags_to_object(Lead.where(:header => header).first, tags)
end

Given /^deal with header "([^"]*)" has tags "([^"]*)"$/ do |header, tags|
  add_tags_to_object(Deal.where(:header => header).first, tags)
end

Given /^result with name "([^"]*)" has tags "([^"]*)"$/ do |name, tags|
  add_tags_to_object(Result.where(:name => name).first, tags)
end

Given /^user with email "([^"]*)" should have tags "([^"]*)"$/ do |email, tags|
  check_tags_for_object(User.where(:email => email).first.with_role, tags)
end

Given /^lead with header "([^"]*)" should have tags "([^"]*)"$/ do |header, tags|
  check_tags_for_object(Lead.where(:header => header).first, tags)
end

Given /^deal with header "([^"]*)" should have tags "([^"]*)"$/ do |header, tags|
  check_tags_for_object(Deal.where(:header => header).first, tags)
end

Given /^contact with email address "([^"]*)" should have tags "([^"]*)"$/ do |email_address, tags|
  check_tags_for_object(Contact.where(:email_address => email_address).first, tags)
end

Given /^I visit page "([^"]*)" with tags "([^"]*)" set as search$/ do |path, tags|
  tags = tags.split(",").map { |t| t.strip }
  tag_params = tags.map { |tag| "search%5Bwith_tags%5D%5B%5D=#{tag}" }.join("&")
  visit "#{path}?#{tag_params}"
end