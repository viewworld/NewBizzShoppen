Given /^I add user role source for role "([^"]*)" to newsletter list "([^"]*)"$/ do |role, list_name|
  newsletter_list = NewsletterList.where(:name => list_name).first
  NewsletterSource.create!(:source_type => NewsletterSource::USER_ROLE_SOURCE, :sourceable => Role.find_by_key(role).first, :newsletter_list => newsletter_list)
end

