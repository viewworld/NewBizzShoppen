Given /^a deal named "([^"]*)" exists within category "([^"]*)"$/ do |name, category_name|
  category = DealCategory.where(:name => category_name).first
  category = DealCategory.make!(:name => category_name) unless category
  deal = Deal.where(:header => name).first
  Deal.make!(:category => category, :header => name, :email_address => User::Customer.first.email) unless deal
end

When /^a deal named "([^"]*)" exists with attributes "([^"]*)"$/ do |name, options|
  deal = Deal.where(:header => name).first
  deal = Deal.make!(:header => name) unless deal
  deal.update_attributes(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

Then /^a deal is created by "([^"]*)" for user "([^"]*)" and category "([^"]*)" with attributes "([^"]*)"$/ do |creator, user, category, attributes|
  deal_attributes = {}; attributes.split("|").each { |attr| deal_attributes[attr.split(":").first] = attr.split(":").last }
  deal = Deal.new_for_user(User.find_by_email(creator))
  deal.update_attributes(deal_attributes)
  deal.currency_id = Currency.first.id
  deal.creator = User.find_by_email(user)
  deal.category_id = Category.find_by_name(category)
    #throw deal
  deal.save!
end

Then /^I filter and sort deals with my deals translation "([^"]*)"$/ do |translation|
  Then %{I follow translated "#{translation}"}
  Then %{I should see "super"}
  Then %{I should see "awesome"}
  Then %{I select translated "common.yes_label" from "search_active_is"}
  Then %{I press translated "leads.index.search.search_button"}
  Then %{I should see "super"}
  Then %{I should not see "awesome"}
  Then %{I select translated "common.no_label" from "search_active_is"}
  Then %{I press translated "leads.index.search.search_button"}
  Then %{I should not see "super"}
  Then %{I should see "awesome"}
  Then %{I follow translated "#{translation}"}
  Then %{I should see "super"}
  Then %{I should see "awesome"}
  Then %{I fill in "search_with_keyword" with "super"}
  Then %{I press translated "leads.index.search.search_button"}
  Then %{I should see "super"}
  Then %{I should not see "awesome"}
  Then %{I follow translated "#{translation}"}
  Then %{I follow translated "shared.deals.table.creation_date"}
  Then %{I should see "awesome" before "super"}
  Then %{I follow translated "shared.deals.table.creation_date"}
  Then %{I should see "super" before "awesome"}
  Then %{I follow translated "shared.deals.table.name"}
  Then %{I should see "awesome" before "super"}
  Then %{I follow translated "shared.deals.table.name"}
  Then %{I should see "super" before "awesome"}
  Then %{I follow translated "shared.deals.table.expires"}
  Then %{I should see "awesome" before "super"}
  Then %{I follow translated "shared.deals.table.expires"}
  Then %{I should see "super" before "awesome"}
end

Then /^I fill deal creation form$/ do
  Then %{I fill in "deal_header" with "very important deal"}
  Then %{I should see "0 characters (140 max)"}
  Then %{I fill in "deal_description" with "batman"}
  Then %{I should see "6 characters (140 max)"}
  Then %{I fill in "deal_hidden_description" with "cat woman"}
  Then %{I fill in "deal_fine_print" with "gotham city"}
  Then %{I fill in "deal_start_date" with "2011-06-06"}
  Then %{I fill in "deal_end_date" with "2016-12-12"}
  Then %{I fill in "deal_company_description" with "bruce wayne inc."}
  Then %{I fill in "deal_deal_url" with "www.deal.com"}
end

Then /^I fill deal edit form and submit with translated button "([^"]*)"$/ do |translation|
  Then %{I check "deal_published"}
  Then %{I select "Business deals" from "deal_category_id"}
  Then %{I fill in "deal_header" with "super amazing deal"}
  Then %{I press translated "#{translation}"}
  Then %{I should see "super amazing deal"}
  Then %{I should see translated "flash.deals.update.notice"}
  Then %{I should not see "very important deal"}
end