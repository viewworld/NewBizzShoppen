Given /^I add user role source for role "([^"]*)" to newsletter list "([^"]*)"$/ do |role, list_name|
  newsletter_list = NewsletterList.where(:name => list_name).first
  NewsletterSource.create!(:source_type => NewsletterSource::USER_ROLE_SOURCE, :sourceable => Role.find_by_key(role).first, :newsletter_list => newsletter_list)
end

Given /^newsletter list named "([^"]*)" is owned by "([^"]*)"$/ do |name, email|
  user = User.where(:email => email).first.with_role
  NewsletterList.make!(:owner => user, :creator => user, :name => name)
end

Given /^I view newsletter template preview for last campaign$/ do
  visit "/newsletters/newsletter_campaigns/#{NewsletterCampaign.last.template_key}"
end