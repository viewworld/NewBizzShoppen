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

Given /^deal with header "([^"]*)" has tags "([^"]*)"$/ do |header, tags|
  add_tags_to_object(Deal.where(:header => header).first, tags)
end

Given /^user with email "([^"]*)" should have tags "([^"]*)"$/ do |email, tags|
  check_tags_for_object(User.where(:email => email).first.with_role, tags)
end

Given /^lead with header "([^"]*)" should have tags "([^"]*)"$/ do |header, tags|
  check_tags_for_object(Lead.where(:header => header).first, tags)
end