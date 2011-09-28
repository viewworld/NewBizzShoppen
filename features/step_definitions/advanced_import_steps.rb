Then /^I use advanced import for contacts$/ do
  And %{I click hidden link by url regex "/contacts_advanced_import/"}
  #wrong imports
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "advanced_import.choose.flash.error_wrong_file"}
  And %{attach the file "contact1badheader_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "advanced_import.choose.flash.error_wrong_title"}
  And %{attach the file "sample image" to "attachment" within "#advanced_import_form"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "advanced_import.choose.flash.error_wrong_file"}
  #first correct import
  And %{attach the file "contact3allgood_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "contacts_advanced_import.choose.view.header"}
  And %{I follow translated "advanced_import.choose.view.cancel_button"}
  And %{I wait 2 second}
  And %{attach the file "contact2badobject_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I select "Testing Two" from "object_id"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I press translated "advanced_import.choose.view.next_button"}
  And %{I press translated "advanced_import.preview.view.import_button"}
  And %{I should see translated "contacts_advanced_import.create.flash.success" with options "counter:0 / 4"}
  And %{campaign "Testing Two" should have "0" contacts}
  And %{attach the file "contact3allgood_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I select "Testing Two" from "object_id"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see "Company name *"}
  And %{I press translated "advanced_import.choose.view.next_button"}
  And %{I should see "1/2"}
  And %{I follow translated "advanced_import.preview.view.cancel_button"}
  And %{I press translated "advanced_import.choose.view.next_button"}
  And %{I follow translated "advanced_import.preview.view.next_object_button"}
  And %{I should see "2/2"}
  And %{I follow translated "advanced_import.preview.view.first_object_button"}
  And %{I should see "1/2"}
  And %{I press translated "advanced_import.preview.view.import_button"}
  And %{I should see translated "contacts_advanced_import.create.flash.success" with options "counter:2 / 2"}
  And %{campaign "Testing Two" should have "2" contacts}
end

Then /^I use advanced import for users "(buyers|procurements)"$/ do |name|
  number = name == 'buyers' ? 3 : 1
  And %{there should be #{number} #{name}}
  And %{I click hidden link by url regex "/#{name}_advanced_import/"}
  #wrong imports
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "advanced_import.choose.flash.error_wrong_file"}
  And %{attach the file "user1badheader_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "advanced_import.choose.flash.error_wrong_title"}
  And %{attach the file "sample image" to "attachment" within "#advanced_import_form"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "advanced_import.choose.flash.error_wrong_file"}
  #first correct import
  And %{attach the file "usert3allgood_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "#{name}_advanced_import.choose.view.header"}
  And %{I follow translated "advanced_import.choose.view.cancel_button"}
  And %{I wait 2 second}
  And %{attach the file "user2badobject_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I press translated "advanced_import.choose.view.next_button"}
  And %{I should see "1/4"}
  And %{I follow translated "advanced_import.preview.view.cancel_button"}
  And %{I press translated "advanced_import.choose.view.next_button"}
  And %{I follow translated "advanced_import.preview.view.next_object_button"}
  And %{I should see "2/4"}
  And %{I follow translated "advanced_import.preview.view.last_object_button"}
  And %{I should see "4/4"}
  And %{I press translated "advanced_import.preview.view.import_button"}
  And %{I should see translated "#{name}_advanced_import.create.flash.success" with options "counter:0 / 4"}
  And %{there should be #{number} #{name}}
  And %{attach the file "usert3allgood_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see "Company name *"}
  And %{I should see "Email *"}
  And %{I press translated "advanced_import.choose.view.next_button"}
  And %{I press translated "advanced_import.preview.view.import_button"}
  And %{I should see translated "#{name}_advanced_import.create.flash.success" with options "counter:2 / 2"}
  And %{there should be #{number+2} #{name}}
  And %{user should exist with email "liu@mk.com" and role "#{name == "buyers" ? "customer" : "purchase_manager"}"}
  And %{user should exist with email "kung@mk.com" and role "#{name == "buyers" ? "customer" : "purchase_manager"}"}

end

When /^there should be (\d+) buyers$/ do |num|
  User::Customer.count.should == num.to_i
end

When /^there should be (\d+) category buyers$/ do |num|
  User::CategoryBuyer.count.should == num.to_i
end

When /^there should be (\d+) procurements$/ do |num|
  User::PurchaseManager.count.should == num.to_i
end

When /^lead category "([^"]*)" has "(\d+)" buyers$/ do |name, num|
  LeadCategory.find_by_name(name).first.buying_users.size.should == num.to_i
end

When /^lead category "([^"]*)" has "(\d+)" leads/ do |name, num|
  LeadCategory.find_by_name(name).first.leads.size.should == num.to_i
end

Then /^campaign "([^"]*)" should have "([^"]*)" contacts$/ do |name, number|
  Campaign.find_by_name(name).contacts.size.should == number.to_i
end

Then /^I use advanced import for category buyers$/ do
  And %{there should be 1 category buyers}
  And %{lead category "Leisure" has "0" buyers}
  And %{I click hidden link by url regex "/buyers_advanced_import/"}
  #wrong imports
  And %{I check "category_buyer_enabled"}
  And %{I confirm a js popup on the next step}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I check "category_buyer_enabled"}
  And %{I select "Leisure" from "object_id"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "advanced_import.choose.flash.error_wrong_file"}
  And %{attach the file "user1badheader_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I check "category_buyer_enabled"}
  And %{I select "Leisure" from "object_id"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "advanced_import.choose.flash.error_wrong_title"}
  And %{attach the file "sample image" to "attachment" within "#advanced_import_form"}
  And %{I check "category_buyer_enabled"}
  And %{I select "Leisure" from "object_id"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "advanced_import.choose.flash.error_wrong_file"}
  #first correct import
  And %{attach the file "usert3allgood_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I check "category_buyer_enabled"}
  And %{I select "Leisure" from "object_id"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "buyers_advanced_import.choose.view.header"}
  And %{I follow translated "advanced_import.choose.view.cancel_button"}
  And %{I wait 2 second}
  And %{attach the file "user2badobject_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I check "category_buyer_enabled"}
  And %{I select "Leisure" from "object_id"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I press translated "advanced_import.choose.view.next_button"}
  And %{I press translated "advanced_import.preview.view.import_button"}
  And %{I should see translated "buyers_advanced_import.create.flash.success" with options "counter:0 / 4"}
  And %{there should be 1 category buyers}
  And %{attach the file "usert3allgood_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I check "category_buyer_enabled"}
  And %{I select "Leisure" from "object_id"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see "Company name *"}
  And %{I should see "Email *"}
  And %{I press translated "advanced_import.choose.view.next_button"}
  And %{I should see "1/2"}
  And %{I follow translated "advanced_import.preview.view.cancel_button"}
  And %{I press translated "advanced_import.choose.view.next_button"}
  And %{I follow translated "advanced_import.preview.view.next_object_button"}
  And %{I should see "2/2"}
  And %{I follow translated "advanced_import.preview.view.first_object_button"}
  And %{I should see "1/2"}
  And %{I press translated "advanced_import.preview.view.import_button"}
  And %{I should see translated "buyers_advanced_import.create.flash.success" with options "counter:2 / 2"}
  And %{there should be 3 category buyers}
  And %{lead category "Leisure" has "2" buyers}
  And %{user should exist with email "liu@mk.com" and role "category_buyer"}
  And %{user should exist with email "kung@mk.com" and role "category_buyer"}
end

Then /^I use advanced import for leads as "(admin|user)"$/ do |role|
  And %{lead category "Business" has "0" leads}
  And %{I click hidden link by url regex "/leads_advanced_import/"}
  #wrong imports
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "advanced_import.choose.flash.error_wrong_file"}
  And %{attach the file "lead1badheader_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "advanced_import.choose.flash.error_wrong_title"}
  And %{attach the file "sample image" to "attachment" within "#advanced_import_form"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "advanced_import.choose.flash.error_wrong_file"}
  #first correct import
  And %{attach the file "lead3allgood_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "leads_advanced_import.choose.view.header"}
  And %{I follow translated "advanced_import.choose.view.cancel_button"}
  And %{I wait 2 second}
  And %{attach the file "lead2badobject_adv_import" to "attachment" within "#advanced_import_form"}
  if role == "admin"
    And %{I select "John Smith" from "creator_id"}
  end
  And %{I select "Business" from "object_id"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I press translated "advanced_import.choose.view.next_button"}
  And %{I press translated "advanced_import.preview.view.import_button"}
  And %{I should see translated "leads_advanced_import.create.flash.success" with options "counter:0 / 4"}
  And %{lead category "Business" has "0" leads}
  And %{attach the file "lead3allgood_adv_import" to "attachment" within "#advanced_import_form"}
  if role == "admin"
    And %{I select "John Smith" from "creator_id"}
  end
  And %{I select "Business" from "object_id"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see "Company name *"}
  And %{I press translated "advanced_import.choose.view.next_button"}
  And %{I should see "1/2"}
  And %{I follow translated "advanced_import.preview.view.cancel_button"}
  And %{I press translated "advanced_import.choose.view.next_button"}
  And %{I follow translated "advanced_import.preview.view.next_object_button"}
  And %{I should see "2/2"}
  And %{I follow translated "advanced_import.preview.view.first_object_button"}
  And %{I should see "1/2"}
  And %{I press translated "advanced_import.preview.view.import_button"}
  And %{I should see translated "leads_advanced_import.create.flash.success" with options "counter:2 / 2"}
  And %{lead category "Business" has "2" leads}
end