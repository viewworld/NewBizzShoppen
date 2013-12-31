Given /^a deal named "([^"]*)" exists within category "([^"]*)"$/ do |name, category_name|
  category = DealCategory.where(:name => category_name).first
  category = DealCategory.make!(:name => category_name) unless category
  deal = Deal.where(:header => name).first
  Deal.make!(:category => category, :header => name, :email_address => User::Supplier.first.email) unless deal
end

When /^a deal named "([^"]*)" exists with attributes "([^"]*)"$/ do |name, options|
  deal = Deal.where(:header => name).first
  deal = Deal.make!(:header => name) unless deal
  deal.update_attributes(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

Then /^a deal is created by "([^"]*)" for user "([^"]*)" and category "([^"]*)" with attributes "([^"]*)"$/ do |creator, user, category, attributes|
  deal_attributes = {}; attributes.split("|").each { |attr| deal_attributes[attr.split(":").first] = attr.split(":").last }
  deal = Deal.new_for_user(User.find_by_email(user))
  deal.attributes = deal_attributes
  deal.currency_id = Currency.first.id
  deal.creator = User.find_by_email(creator).with_role
  deal.category_id = DealCategory.where(:name => category).first.id
  deal.save!
end

Then /^a deal named "([^"]*)" has rating set to "([^"]*)"$/ do |name, rating|
  Deal.find_by_header(name).deal_average_rating.to_i.should == rating.to_i
end

Then /^I filter and sort deals with my deals translation "([^"]*)"$/ do |translation|
  Then %{I follow translated "#{translation}"}
  Then %{I select "" from "search_active_is"}
  Then %{I press translated "leads.index.search.search_button"}
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
  Then %{I select "" from "search_active_is"}
  Then %{I press translated "leads.index.search.search_button"}
  Then %{I should see "super"}
  Then %{I should see "awesome"}
  Then %{I fill in "search_with_keyword" with "super"}
  Then %{I press translated "leads.index.search.search_button"}
  Then %{I should see "super"}
  Then %{I should not see "awesome"}
  Then %{I follow translated "#{translation}"}
  Then %{I select "" from "search_active_is"}
  Then %{I press translated "leads.index.search.search_button"}
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
  Then %{I fill in "deal_hidden_description_editor" ckeditor with "cat woman"}
  Then %{I fill in "deal_fine_print_editor" ckeditor with "gotham city"}
  Then %{I fill in "deal_start_date" with "2011-06-06"}
  Then %{I fill in "deal_end_date" with "2016-12-12"}
  Then %{I fill in "deal_company_description_editor" ckeditor with "bruce wayne inc."}
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
  Then %{last email sent should have content "Certify the deal"}
  Then %{I should see translated "flash.deals.create.notice"}
  Then %{I should see translated "deals.common.listing.view.header"}
  Then %{I should see "very important deal"}
end

Then /^I fill group deal edit form and submit with translated button "([^"]*)"$/ do |translation|
  Then %{I check "deal_group_deal"}
  Then %{I press translated "#{translation}"}
  Then %{I fill in "deal_social_media_description" with "face book is better then link ed in, are you agree?"}
  Then %{I fill in "deal_deal_price" with "-1"}
  Then %{I press translated "#{translation}"}
  Then %{I fill in "deal_discounted_price" with ""}
  Then %{I press translated "#{translation}"}
  Then %{I fill in "deal_deal_price" with "100"}
  Then %{I fill in "deal_discounted_price" with "44.4"}
  Then %{I press translated "#{translation}"}
  Then %{I should see translated "flash.deals.update.notice"}
end

Then /I add and remove logo for deal as "([^"]*)"/ do |role|
  Then %{I follow translated "layout.main_menu.#{role == "administration" ? "admin" : role == "supplier" ? "lead_supplier" : role}.#{"my_" if role == "supplier"}deals"}
  Then %{I follow translated "#{role}.deals.index.view.edit"}
  Then %{attach the file "sample image" to "deal_logo_attributes_asset"}
  Then %{I press translated "#{role}.deals.edit.view.update_button"}
  Then %{I should see translated "deals.common.assets.view.show_image"}
  Then %{I follow translated "deals.common.assets.view.remove_logo"}
  Then %{I should see translated "flash.deal_assets.destroy.success"}
  Then %{I should see translated "#{role}.deals.edit.view.title"}
end

Then /I add and remove document for deal as "([^"]*)"/ do |role|
  Then %{I follow translated "layout.main_menu.#{role == "administration" ? "admin" : role == "supplier" ? "lead_supplier" : role}.#{"my_" if role == "supplier"}deals"}
  Then %{I follow translated "#{role}.deals.index.view.edit"}
  Then %{attach the file "document" to "deal_materials_attributes_0_asset"}
  Then %{I press translated "#{role}.deals.edit.view.update_button"}
  Then %{I should see translated "deals.common.assets.view.download"}
  Then %{attach the file "document" to "deal_materials_attributes_0_asset"}
  Then %{I press translated "#{role}.deals.edit.view.update_button"}
  Then %{I follow translated "deals.common.assets.view.remove_material"}
  Then %{I should see translated "flash.deal_assets.destroy.success"}
  Then %{I should see translated "#{role}.deals.edit.view.title"}
end

Then /I add and remove internal document for deal as "([^"]*)"/ do |role|
  Then %{I follow translated "layout.main_menu.#{role == "administration" ? "admin" : role == "supplier" ? "lead_supplier" : role}.#{"my_" if role == "supplier"}deals"}
  Then %{I follow translated "#{role}.deals.index.view.edit"}
  Then %{attach the file "document" to "deal_internal_documents_attributes_0_asset"}
  Then %{I press translated "#{role}.deals.edit.view.update_button"}
  Then %{I should see translated "deals.common.assets.view.download"}
  Then %{attach the file "document" to "deal_internal_documents_attributes_0_asset"}
  Then %{I press translated "#{role}.deals.edit.view.update_button"}
  Then %{I follow translated "deals.common.assets.view.remove_material"}
  Then %{I should see translated "flash.deal_assets.destroy.success"}
  Then %{I should see translated "#{role}.deals.edit.view.title"}
end

Then /I add and remove image for deal as "([^"]*)"/ do |role|
  Then %{I follow translated "layout.main_menu.#{role == "administration" ? "admin" : role == "supplier" ? "lead_supplier" : role}.#{"my_" if role == "supplier"}deals"}
  Then %{I follow translated "#{role}.deals.index.view.edit"}
  Then %{attach the file "sample image" to "deal_images_attributes_0_asset"}
  Then %{I press translated "#{role}.deals.edit.view.update_button"}
  Then %{I should see translated "deals.common.assets.view.show_image"}
  Then %{attach the file "sample image" to "deal_images_attributes_0_asset"}
  Then %{I press translated "#{role}.deals.edit.view.update_button"}
  Then %{I follow translated "deals.common.assets.view.remove_material"}
  Then %{I should see translated "flash.deal_assets.destroy.success"}
  Then %{I should see translated "#{role}.deals.edit.view.title"}
end

When /^I visit certification url for last deal$/ do
  deal = Deal.order("created_at DESC").first
  visit "/deals/#{deal.id}/edit?token=#{deal.current_dcr.token}"
end

When /^the last deal should (be|not be) certified$/ do |is_certified|
  deal = Deal.order("created_at DESC").first
  assert deal.current_dcr.approved? == (is_certified == "be")
end

Given /^deal named "([^"]*)" is a primary featured deal$/ do |deal_header|
  deal = Deal.where(:header => deal_header).first
  FeaturedDeal.create!(:position => 0, :deal_id => deal.id)
end

Given /^deal named "([^"]*)" is "([^"]*)" primary featured deal$/ do |deal_header, num|
  deal = Deal.where(:header => deal_header).first
  FeaturedDeal.create!(:position => num, :deal_id => deal.id)
end

Given /^deal named "([^"]*)" is "([^"]*)" secondary featured deal$/ do |deal_header, num|
  deal = Deal.where(:header => deal_header).first
  FeaturedDeal.create!(:position => num.to_i+4, :deal_id => deal.id)
end

When /^I append id of deal "([^"]*)" to url$/ do |deal_header|
  deal = Deal.where(:header => deal_header).first
  visit "/#{deal.id}"
end

Given /^there are no deals$/ do
  Deal.delete_all
end

Then /^the only deal should have end date set to one year from now$/ do
  (Deal.first.end_date.to_date - Date.today).to_i.should >= 365
end

Then /^lead generated from deal in category "([^"]*)" by "([^"]*)" (is|is not) bought$/ do |category_name, email, is_bought|
  user = User.where(:email => email).first.with_role
  category = Category.where(:name => category_name).first
  lead = Lead.where(:category_id => category.id, :requested_by => user.id).first
  assert lead.lead_purchases.any? == (is_bought == "is")
end

Given /^there are "([^"]*)" existing deals$/ do |num|
  num.to_i.times{Deal.make!}
end

Given /^deal named "([^"]*)" has been unpublished$/ do |deal_header|
  deal = Deal.where(:header => deal_header).first
  deal.published = false
  deal.save
end

Given /^deal named "([^"]*)" has deal template "([^"]*)" assigned$/ do |deal_header, deal_template_name|
  deal = Deal.where(:header => deal_header).first
  deal.deal_templates << LeadTemplate.where(:name => deal_template_name).first
  deal.save
end