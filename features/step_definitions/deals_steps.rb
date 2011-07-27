Given /^a deal named "([^"]*)" exists within category "([^"]*)"$/ do |name, category_name|
  category = Category.where(:name => category_name).first
  category = Category.make!(:name => category_name) unless category
  deal = Deal.where(:header => name).first
  Deal.make!(:category => category, :header => name) unless deal
end

When /^a deal named "([^"]*)" exists with attributes "([^"]*)"$/ do |name, options|
  deal = Deal.where(:header => name).first
  deal = Deal.make!(:header => name) unless deal
  deal.update_attributes(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

Then /^a deal is created by "([^"]*)" for user "([^"]*)" and category "([^"]*)" with attributes "([^"]*)"$/ do |creator, user, category, attributes|
  deal_attributes = {};attributes.split("|").each{|attr| deal_attributes[attr.split(":").first] = attr.split(":").last}
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
    Then %{I should see "super" before "awesome"}
    Then %{I follow translated "shared.deals.table.creation_date"}
    Then %{I should see "awesome" before "super"}
    Then %{I follow translated "shared.deals.table.name"}
    Then %{I should see "awesome" before "super"}
    Then %{I follow translated "shared.deals.table.name"}
    Then %{I should see "super" before "awesome"}
    Then %{I follow translated "shared.deals.table.expires"}
    Then %{I should see "awesome" before "super"}
    Then %{I follow translated "shared.deals.table.expires"}
    Then %{I should see "super" before "awesome"}
end