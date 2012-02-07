Then /^I use advanced import for contacts (unique|not unique)$/ do |unique|
  steps %Q{
  And I click hidden link by url regex "/contacts_advanced_import/"}
  #wrong imports
  steps %Q{
#{'And I check "unique_only"' if unique == "unique"}
    And I press translated "advanced_import.show.view.button" within "#advanced_import_form"
    And I should see translated "advanced_import.choose.flash.error_wrong_file"
    And attach the file "contact1badheader_adv_import" to "attachment" within "#advanced_import_form"
#{'And I check "unique_only"' if unique == "unique"}
    And I press translated "advanced_import.show.view.button" within "#advanced_import_form"
    And I should see translated "advanced_import.choose.flash.error_wrong_title"
    And attach the file "sample image" to "attachment" within "#advanced_import_form"
#{'And I check "unique_only"' if unique == "unique"}
    And I press translated "advanced_import.show.view.button" within "#advanced_import_form"
    And I should see translated "advanced_import.choose.flash.error_wrong_file"}
  #first correct import
  steps %Q{
    And attach the file "contact3allgood_adv_import" to "attachment" within "#advanced_import_form"
#{'And I check "unique_only"' if unique == "unique"}
    And I press translated "advanced_import.show.view.button" within "#advanced_import_form"
    And I should see translated "contacts_advanced_import.choose.view.header"
    And I follow translated "advanced_import.choose.view.cancel_button"
    And I wait 2 second
    And attach the file "contact2badobject_adv_import" to "attachment" within "#advanced_import_form"
    And I select "Testing Two" from "object_id"
#{'And I check "unique_only"' if unique == "unique"}
    And I press translated "advanced_import.show.view.button" within "#advanced_import_form"
    And I press translated "advanced_import.choose.view.next_button"
    And I press translated "advanced_import.preview.view.import_button"
    And last email sent should have content "0 / 4 items had been imported"
    And campaign "Testing Two" should have "0" contacts
    And attach the file "contact3allgood_adv_import" to "attachment" within "#advanced_import_form"
    And I select "Testing Two" from "object_id"
#{'And I check "unique_only"' if unique == "unique"}
    And I press translated "advanced_import.show.view.button" within "#advanced_import_form"
    And I should see "Company name *"
    And I press translated "advanced_import.choose.view.next_button"
    And I should see "1/2"
    And I follow translated "advanced_import.preview.view.cancel_button"
    And I press translated "advanced_import.choose.view.next_button"
    And I follow translated "advanced_import.preview.view.next_object_button"
    And I should see "2/2"
    And I follow translated "advanced_import.preview.view.first_object_button"
    And I should see "1/2"
    And I press translated "advanced_import.preview.view.import_button"
    And last email sent should have content "2 / 2 items had been imported"
    And campaign "Testing Two" should have "2" contacts}
  if unique == "unique"
#second correct import - but unique is on and there is only unique contacts
    steps %Q{
And attach the file "contact3allgood_adv_import" to "attachment" within "#advanced_import_form"
And I select "Testing Two" from "object_id"
And I check "unique_only"
And I press translated "advanced_import.show.view.button" within "#advanced_import_form"
And I press translated "advanced_import.choose.view.next_button"
And I follow translated "advanced_import.preview.view.cancel_button"
And I press translated "advanced_import.choose.view.next_button"
And I press translated "advanced_import.preview.view.import_button"
And last email sent should have content "0 / 2 items had been imported"
And campaign "Testing Two" should have "2" contacts
}
#third correct import
    steps %Q{
And attach the file "contact3allgood_adv_import" to "attachment" within "#advanced_import_form"
And I select "Testing Two" from "object_id"
And I press translated "advanced_import.show.view.button" within "#advanced_import_form"
And I press translated "advanced_import.choose.view.next_button"
And I press translated "advanced_import.preview.view.import_button"
And last email sent should have content "2 / 2 items had been imported"
And campaign "Testing Two" should have "4" contacts}
  end
end


Then /^I use advanced import for users "(suppliers|members)"$/ do |name|
  number = name == 'suppliers' ? 3 : 1
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
  And %{last email sent should have content "0 / 4 items had been imported"}
  And %{there should be #{number} #{name}}
  And %{attach the file "usert3allgood_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see "Company name *"}
  And %{I should see "Email *"}
  And %{I press translated "advanced_import.choose.view.next_button"}
  And %{I press translated "advanced_import.preview.view.import_button"}
  And %{last email sent should have content "2 / 2 items had been imported"}
  And %{there should be #{number+2} #{name}}
  And %{user should exist with email "liu@mk.com" and role "#{name == "suppliers" ? "supplier" : "member"}"}
  And %{user should exist with email "kung@mk.com" and role "#{name == "suppliers" ? "supplier" : "member"}"}

end

When /^there should be (\d+) suppliers$/ do |num|
  User::Supplier.count.should == num.to_i
end

When /^there should be (\d+) category suppliers$/ do |num|
  User::CategorySupplier.count.should == num.to_i
end

When /^there should be (\d+) members$/ do |num|
  User::Member.count.should == num.to_i
end

When /^lead category "([^"]*)" has "(\d+)" suppliers$/ do |name, num|
  LeadCategory.find_by_name(name).first.buying_users.size.should == num.to_i
end

When /^lead category "([^"]*)" has "(\d+)" leads/ do |name, num|
  LeadCategory.find_by_name(name).first.leads.size.should == num.to_i
end

Then /^campaign "([^"]*)" should have "([^"]*)" contacts$/ do |name, number|
  Campaign.find_by_name(name).contacts.size.should == number.to_i
end

Then /^I use advanced import for category suppliers$/ do
  And %{there should be 1 category suppliers}
  And %{lead category "Leisure" has "0" suppliers}
  And %{I click hidden link by url regex "/suppliers_advanced_import/"}
  #wrong imports
  And %{I check "category_supplier_enabled"}
  And %{I confirm a js popup on the next step}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I check "category_supplier_enabled"}
  And %{I select "Leisure" from "object_id"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "advanced_import.choose.flash.error_wrong_file"}
  And %{attach the file "user1badheader_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I check "category_supplier_enabled"}
  And %{I select "Leisure" from "object_id"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "advanced_import.choose.flash.error_wrong_title"}
  And %{attach the file "sample image" to "attachment" within "#advanced_import_form"}
  And %{I check "category_supplier_enabled"}
  And %{I select "Leisure" from "object_id"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "advanced_import.choose.flash.error_wrong_file"}
  #first correct import
  And %{attach the file "usert3allgood_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I check "category_supplier_enabled"}
  And %{I select "Leisure" from "object_id"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I should see translated "suppliers_advanced_import.choose.view.header"}
  And %{I follow translated "advanced_import.choose.view.cancel_button"}
  And %{I wait 2 second}
  And %{attach the file "user2badobject_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I check "category_supplier_enabled"}
  And %{I select "Leisure" from "object_id"}
  And %{I press translated "advanced_import.show.view.button" within "#advanced_import_form"}
  And %{I press translated "advanced_import.choose.view.next_button"}
  And %{I press translated "advanced_import.preview.view.import_button"}
  And %{last email sent should have content "0 / 4 items had been imported"}
  And %{there should be 1 category suppliers}
  And %{attach the file "usert3allgood_adv_import" to "attachment" within "#advanced_import_form"}
  And %{I check "category_supplier_enabled"}
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
  And %{last email sent should have content "2 / 2 items had been imported"}
  And %{there should be 3 category suppliers}
  And %{lead category "Leisure" has "2" suppliers}
  And %{user should exist with email "liu@mk.com" and role "category_supplier"}
  And %{user should exist with email "kung@mk.com" and role "category_supplier"}
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
  And %{last email sent should have content "0 / 4 items had been imported"}
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
  And %{last email sent should have content "2 / 2 items had been imported"}
  And %{lead category "Business" has "2" leads}
end