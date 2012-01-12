@lead_catalog @$_guest @m1
Feature: Leads listing for guest

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And Category named "Sample category" already exists
  And Category named "Another sample category" already exists within category named "Sample category"
  And I sign in as buyer@nbs.com with password secret
  And I follow translated "layout.main_menu.shared.browse_leads"

@_tested @bk @_done
Scenario: I should see an image and a description for each category
  Then I should see "Sample category"

@_tested_elsewhere @_done
Scenario: I can click on a category name and see a list of leads in that category

@m2 @_tested @tgn @_done
Scenario: I should see leads that belong to a user which is blocked
  Given Lead named "Lead 1" exists within "Sample category" category
  And I have user with email agent@person.com and role agent
  And lead Lead 1 is created by user agent@person.com with role agent
  And I follow category "Sample category"
  Then I should see "Lead 1"
  When User agent@person.com with role agent is blocked
  And I go to browse leads
  And I follow category "Sample category"
  Then I should see "Lead 1"

@_tested @bk @_done
Scenario: I can browse leads in a given category with pagination
  Given pagination page size for leads is set to 3
  And Lead named "Lead 1" exists within "Sample category" category
  And Lead named "Lead 2" exists within "Sample category" category
  And Lead named "Lead 3" exists within "Sample category" category
  And Lead named "Lead 4" exists within "Sample category" category
  And I follow category "Sample category"
  Then I follow "2"

@bk @_tested @_done
Scenario: I should see lead header, lead price, purchase value, created by and public description
  Given Category named "One more sample category" already exists
  And lead Nice exists within category One more sample category
  And I follow translated "layout.main_menu.shared.browse_leads"
  And I follow category "One more sample category"
  Then I should see "Nice"

@m2 @tgn @_tested @_done
Scenario: I should see certification level for each lead
  Given Lead named "Lead 1" exists within "Sample category" category
  And I follow category "Sample category"
  Then I should see translated "models.lead.certification.lvl0"

@m3 @tgn @_tested @_done
Scenario: I should see rating % for each lead
  Given Lead named "Lead 392S2" exists within "Sample category" category
  And I have user with email customer.john.doe1@person.com and role supplier
  And I have user with email customer.john.doe2@person.com and role supplier
  And I have user with email customer.john.doe3@person.com and role supplier
  And I have user with email customer.john.doe4@person.com and role supplier
  And a lead Lead 392S2 exists within category Sample category and is bought by user customer.john.doe1@person.com with role supplier
  And a lead Lead 392S2 exists within category Sample category and is bought by user customer.john.doe2@person.com with role supplier
  And a lead Lead 392S2 exists within category Sample category and is bought by user customer.john.doe3@person.com with role supplier
  And a lead Lead 392S2 exists within category Sample category and is bought by user customer.john.doe4@person.com with role supplier
  And a lead purchase for lead "Lead 392S2" by user "customer.john.doe1@person.com" with role "supplier" exists with attributes "rating_level:0,rating_reason:Abcd efgh"
  And a lead purchase for lead "Lead 392S2" by user "customer.john.doe2@person.com" with role "supplier" exists with attributes "rating_level:2,rating_reason:Abcd efgh"
  And a lead purchase for lead "Lead 392S2" by user "customer.john.doe3@person.com" with role "supplier" exists with attributes "rating_level:1,rating_reason:Abcd efgh"
  And a lead purchase for lead "Lead 392S2" by user "customer.john.doe4@person.com" with role "supplier" exists with attributes ""
  Given All leads have refreshed average ratings
  And I follow category "Sample category"
  Then I should see "58%"

@m2 @tgn @_tested @_done
Scenario: I should see hottness, novelty, exposure, clicks
  Given Lead named "Lead 1" exists within "Sample category" category
  And lead Lead 1 exists with attributes "clicks_count:17,exposures_count:887"
  And I follow category "Sample category"
  Then I should see translated "models.lead.hotness.lvl1"
  And I should see translated "models.lead.novelty.lvl0"
  And I should see "887"
  And I should see "17"

@m3 @tgn @_tested @_done @selenium
Scenario: I should be able to click "Add to cart button" that will redirect me to login page
  Given I am not sign in
  Given I am signed up and confirmed as user with email johnbuyer3434@person.com and password secret and role supplier
  Given Lead named "Lead 392S2" exists within "Sample category" category
  And I am on the homepage
  And I follow "Lead 392S2"
  Then I follow translated "leads.index.add_to_cart_link"
  And I should see translated "devise.failure.unauthenticated"
  Then I fill in "user_email" with "johnbuyer3434@person.com"
  And I fill in "user_password" with "secret"
  And I press translated "home.show.view.sign_in"
  Then I should see "Lead 392S2"

@m5 @tgn @_tested @_done @selenium
Scenario: If I successfully login after requesting a lead being added to a cart, that lead should be added to cart (or bought if I am big buyer)
  Given I am signed up and confirmed as user with email johnbuyer3434@person.com and password secret and role supplier
  Given Lead named "Lead sample" exists within "Sample category" category
  Given I am not sign in
  And I am on the homepage
  Then I follow "Lead sample"
  Then I follow translated "leads.index.add_to_cart_link"
  And I sign in as johnbuyer3434@person.com with password secret
  And I click hidden link by url regex "/suppliers\/cart$/"
  Then I should see "Lead sample"
  Given I am not sign in
  Given I am signed up and confirmed as user with email johnbigbuyer343888@person.com and password secret and role supplier
  And User johnbigbuyer343888@person.com with role supplier is big buyer
  Then I follow "Lead sample"
  Then I follow translated "leads.index.add_to_cart_link"
  And I sign in as johnbigbuyer343888@person.com with password secret
  Then I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  And I should see "Lead sample"

@m5 @added @tgn @sprint_5_corrections @_tested @_done
Scenario: When I browse a lead category, the lead category should be displayed very clear beside the "Leads flag" on the upper left side of the screen
  When I follow category "Sample category"
  Then I should see "Leads for Sample category"

@m5 @added @tgn @_tested @_done @selenium
Scenario: I should be able to click "Add to cart button" that will redirect me to login page where I can create new account
  Given I am not sign in
  And I am on the homepage
  Given lead Great marketing deal exists within category VariousLeads
  And I follow "GPS receivers required"
  Then I follow translated "leads.index.add_to_cart_link"
  And I follow translated "supplier_home.show.view.create_new_supplier_account"
  Then I fill in "user_category_supplier_first_name" with "John"
  And I fill in "user_category_supplier_last_name" with "Doe"
  And I fill in "user_category_supplier_company_name" with "Doe Ltd"
  And I fill in "user_category_supplier_phone" with "31242342424234"
  And I fill in "user_category_supplier_email" with "johndoecustomer@person.com"
  And I fill in "user_category_supplier_screen_name" with "John D."
  And I fill in "user_category_supplier_password" with "secret"
  And I fill in "user_category_supplier_password_confirmation" with "secret"
  And I fill in "user_category_supplier_address_attributes_address_line_1" with "Ferterds"
  And I fill in "user_category_supplier_address_attributes_address_line_2" with "Boston"
  And I fill in "user_category_supplier_address_attributes_address_line_3" with "Boston"
  And I fill in "user_category_supplier_address_attributes_zip_code" with "12421S"
  And I click div "subscription_plan_"
  And I select "Denmark" from "user_category_supplier_address_attributes_country_id"
  And I check "user_category_supplier_agreement_read"
  And I press translated "supplier_accounts.new.view.button_create_account"
  And user "johndoecustomer@person.com" with role "category_supplier" is confirmed
  And I sign in as johndoecustomer@person.com with password secret
  Then I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  Then I should see "GPS receivers required"

@m5 @tgn @_tested @_done @selenium
Scenario: If I successfully login after requesting a lead being added to a cart, that lead should be added to cart (or bought if I am big buyer)
  Given I am not sign in
  Given I am signed up and confirmed as user with email buyer21@person.com and password supersecret and role supplier
  Given lead Great marketing deal exists within category VariousLeads
  And I am on the homepage
  And I follow "Great marketing deal"
  And I follow translated "leads.index.add_to_cart_link"
  And I sign in as buyer21@person.com with password supersecret
  And I click hidden link by url regex "/suppliers\/cart$/"
  Then I should see "Great marketing deal"

@m5 @added @lead_templates @tgn @_tested @_done
Scenario: I can see lead template fields with public values for each lead
  Given lead Printers ultimate deal exists within category Computers
  And template named "Printers details" for category "Computers" is created by user "ccagent@person.com" with role "call_centre_agent"
  And template named "Printers details" has following fields "printers protocol:true:false, vendor name:false:false, versions:false:false"
  And template named "Printers details" for lead "Printers ultimate deal" has values "printers protocol:xprinter3, vendor name:Havlett Packard, versions:3983c-39282f"
  And I go to browse leads
  And I follow category "Computers"
  Then I should see "PRINTERS DETAILS"
  And I should see "printers protocol"
  And I should see "vendor name"
  And I should see "versions"
  And I should see "Havlett Packard"
  And I should see "3983c-39282f"
  And I should not see "xprinter3"
  And I should see translated "shared.lead_templates.listing.hidden_value"

@m5 @added @lead_templates @tgn @_done @_tested_elsewhere
Scenario: I can see only lead template fields' names (not values) for hidden fields

@m5 @unique_categories @added @_tested @tgn @_done
Scenario: I should not see customer unique categories on 'Browse leads' categories listing
  Given I have user with email other_customer@nbs.com and role supplier
  And Category Other Customer Unique Category is created
  And category "Other Customer Unique Category" is unique for user with email "other_customer@nbs.com" role "supplier"
  When I go to browse leads
  Then I should not see "Other Customer Unique Category"

@m5 @unique_categories @added @_tested @tgn @_done @_deprecated
Scenario: I should not see agent unique categories on 'Browse leads' categories listing
#  Given I have user with email other_agent@nbs.com and role agent
#  And Category Other Agent Unique Category is created
#  And category "Other Agent Unique Category" is unique for user with email "other_agent@nbs.com" role "agent"
#  When I go to browse leads
#  Then I should not see "Other Agent Unique Category"

@m5 @unique_categories @added @non_testable @_done @tgn
Scenario: I should not see leads from customer unique categories

@m5 @unique_categories @added @non_testable @_done @tgn
Scenario: I should not see leads from agent unique categories

@m5 @unique_categories @added @_tested @tgn @_done @_deprecated
Scenario: I should not see customer unique categories in a search filter
#  Given I have user with email other_customer@nbs.com and role supplier
#  And Category Other Customer Unique Category is created
#  And category "Other Customer Unique Category" is unique for user with email "other_customer@nbs.com" role "supplier"
#  When I go to browse leads
#  And I follow category "Electronics"
#  Then "search_with_category" dropdown should not have values "Other Customer Unique Category"

@m5 @unique_categories @added @_tested @tgn @_done @_deprecated
Scenario: I should not see agent unique categories in a search filter
#  Given I have user with email other_agent@nbs.com and role agent
#  And Category Other Agent Unique Category is created
#  And category "Other Agent Unique Category" is unique for user with email "other_agent@nbs.com" role "agent"
#  When I go to browse leads
#  And I follow category "Electronics"
#  Then "search_with_category" dropdown should not have values "Other Agent Unique Category"

@lead_certification @requested @m10 @_done @_tested
Scenario: Every certified lead is marked by an icon in the lead listing
  When there are no leads
  And Category named "BestLeads" already exists
  And I am signed up and confirmed as user with email agent007@nbs.com and password secret and role agent
  And lead "BestLead" is created in category "BestLeads" by user "agent007@nbs.com" with role "agent"
  And lead "BestLead" has attributes "email_address:james@bond.co.uk"
  And lead "BestLead" is certified
  And I am on browse leads
  And I follow category "BestLeads"
  Then I should see CSS path "img.certificate_icon"
  When I am on the BestLead lead page
  Then I should see CSS path "div.certificate"