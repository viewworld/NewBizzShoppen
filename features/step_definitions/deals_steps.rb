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
  deal.category_id = DealCategory.find_by_name(category)
  deal.save!
end

Then /^a deal named "([^"]*)" has rating set to "([^"]*)"$/ do |name, rating|
  Deal.find_by_header(name).first.deal_average_rating.to_i.should == rating.to_i
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

Then /^I certify deal with translation "([^"]*)"$/ do |translation|
  Then %{I fill deal creation form}
  Then %{I select "DKK" from "deal_currency_id"}
  Then %{I fill in "deal_price" with "10"}
  Then %{I select "Business" from "deal_lead_category_id"}
  Then %{I fill in "deal_company_name" with "Starks"}
  Then %{I fill in "deal_contact_name" with "Ned Stark"}
  Then %{I fill in "deal_email_address" with "ned@stark.com"}
  Then %{I fill in "deal_phone_number" with "123 123 123"}
  Then %{I fill in "deal_address_line_1" with "North"}
  Then %{I fill in "deal_address_line_2" with "Fort"}
  Then %{I fill in "deal_address_line_3" with "Winter is coming"}
  Then %{I fill in "deal_zip_code" with "33-333"}
  Then %{I press translated "#{translation}"}
  Then %{last email sent should have been sent to recipient "ned@stark.com"}
  Then %{last email sent should have subject "Deal certification request from Fairleads.com"}
  Then %{last email sent should have content "/buyer_accounts/new"}
  Then %{I should see translated "flash.deals.create.notice"}
  Then %{I should see translated "deals.common.listing.view.header"}
  Then %{I should see "very important deal"}
end

Then /I add and remove logo for deal as "([^"]*)"/ do |role|
  Then %{I follow translated "layout.main_menu.#{role == "administration" ? "admin" : role == "buyer" ? "lead_buyer" : role}.#{"my_" if role == "buyer"}deals"}
  Then %{I follow translated "#{role}.deals.index.view.edit"}
  Then %{attach the file "sample image" to "deal_logo_attributes_asset"}
  Then %{I press translated "#{role}.deals.edit.view.update_button"}
  Then %{I follow translated "#{role}.deals.index.view.edit"}
  Then %{I should see translated "deals.common.assets.view.show_image"}
  Then %{I follow translated "deals.common.assets.view.remove_logo"}
  Then %{I should see translated "flash.deal_assets.destroy.success"}
  Then %{I should see translated "#{role}.deals.edit.view.title"}
end

Then /I add and remove document for deal as "([^"]*)"/ do |role|
  Then %{I follow translated "layout.main_menu.#{role == "administration" ? "admin" : role == "buyer" ? "lead_buyer" : role}.#{"my_" if role == "buyer"}deals"}
  Then %{I follow translated "#{role}.deals.index.view.edit"}
  Then %{attach the file "document" to "deal_materials_attributes_0_asset"}
  Then %{I press translated "#{role}.deals.edit.view.update_button"}
  Then %{I follow translated "#{role}.deals.index.view.edit"}
  Then %{I should see translated "deals.common.assets.view.download"}
  Then %{attach the file "document" to "deal_materials_attributes_0_asset"}
  Then %{I press translated "#{role}.deals.edit.view.update_button"}
  Then %{I follow translated "#{role}.deals.index.view.edit"}
  Then %{I follow translated "deals.common.assets.view.remove_material"}
  Then %{I should see translated "flash.deal_assets.destroy.success"}
  Then %{I should see translated "#{role}.deals.edit.view.title"}
end

Then /I add and remove image for deal as "([^"]*)"/ do |role|
  Then %{I follow translated "layout.main_menu.#{role == "administration" ? "admin" : role == "buyer" ? "lead_buyer" : role}.#{"my_" if role == "buyer"}deals"}
  Then %{I follow translated "#{role}.deals.index.view.edit"}
  Then %{attach the file "sample image" to "deal_images_attributes_0_asset"}
  Then %{I press translated "#{role}.deals.edit.view.update_button"}
  Then %{I follow translated "#{role}.deals.index.view.edit"}
  Then %{I should see translated "deals.common.assets.view.show_image"}
  Then %{attach the file "sample image" to "deal_images_attributes_0_asset"}
  Then %{I press translated "#{role}.deals.edit.view.update_button"}
  Then %{I follow translated "#{role}.deals.index.view.edit"}
  Then %{I follow translated "deals.common.assets.view.remove_material"}
  Then %{I should see translated "flash.deal_assets.destroy.success"}
  Then %{I should see translated "#{role}.deals.edit.view.title"}
end