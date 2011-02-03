@lead_catalog @$_guest @m1
Feature: Leads listing for guest

Background:
  Given I am on the homepage
  And I make sure current locale is English
  And Category named "Sample category" already exists
  And Category named "Another sample category" already exists within category named "Sample category"
  And I follow translated "layout.main_menu.shared.browse_leads"

@_tested @bk
Scenario: I should see an image and a description for each category
  Then I should see "Sample category"

@tested_elsewhere
Scenario: I can click on a category name and see a list of leads in that category

@m2 @_tested @tgn
Scenario: I should not see any leads that belong to a user which is blocked
  Given Lead named "Lead 1" exists within "Sample category" category
  And I have user with email agent@person.com and role agent
  And lead Lead 1 is created by user agent@person.com with role agent
  And I follow "Sample category"
  Then I should see "Lead 1"
  When User agent@person.com with role agent is blocked
  And I go to browse leads
  And I follow "Sample category"
  Then I should not see "Lead 1"

@_tested @bk
Scenario: I can browse leads in a given category with pagination
  Given pagination page size for leads is set to 3
  And Lead named "Lead 1" exists within "Sample category" category
  And Lead named "Lead 2" exists within "Sample category" category
  And Lead named "Lead 3" exists within "Sample category" category
  And Lead named "Lead 4" exists within "Sample category" category
  And I follow "Sample category"
  Then I follow "2"

@bk @_tested
Scenario: I should see lead header, lead price, purchase value, created by and public description
  Given a category "cat1" exists with name: "One more sample category"
  And a lead exists with header: "Nice", category: category "cat1", company_name: "Google", phone_number: "0123456789"
  And I follow translated "layout.main_menu.shared.browse_leads"
  And I follow "One more sample category"
  Then I should see "Nice"

@m2 @tgn @_tested
Scenario: I should see certification level for each lead
  Given Lead named "Lead 1" exists within "Sample category" category
  And I follow "Sample category"
  Then I should see translated "models.lead.certification.lvl0"

@m3 @tgn @_tested @_done
Scenario: I should see rating % for each lead
  Given Lead named "Lead 392S2" exists within "Sample category" category
  And I have user with email customer.john.doe1@person.com and role customer
  And I have user with email customer.john.doe2@person.com and role customer
  And I have user with email customer.john.doe3@person.com and role customer
  And I have user with email customer.john.doe4@person.com and role customer
  And a lead Lead 392S2 exists within category Sample category and is bought by user customer.john.doe1@person.com with role customer
  And a lead Lead 392S2 exists within category Sample category and is bought by user customer.john.doe2@person.com with role customer
  And a lead Lead 392S2 exists within category Sample category and is bought by user customer.john.doe3@person.com with role customer
  And a lead Lead 392S2 exists within category Sample category and is bought by user customer.john.doe4@person.com with role customer
  And a lead purchase for lead "Lead 392S2" by user "customer.john.doe1@person.com" with role "customer" exists with attributes "rating_level:0,rating_reason:Abcd efgh"
  And a lead purchase for lead "Lead 392S2" by user "customer.john.doe2@person.com" with role "customer" exists with attributes "rating_level:2,rating_reason:Abcd efgh"
  And a lead purchase for lead "Lead 392S2" by user "customer.john.doe3@person.com" with role "customer" exists with attributes "rating_level:1,rating_reason:Abcd efgh"
  And a lead purchase for lead "Lead 392S2" by user "customer.john.doe4@person.com" with role "customer" exists with attributes ""
  Given All leads have refreshed average ratings
  And I follow "Sample category"
  Then I should see "58%"

@m2 @tgn @_tested
Scenario: I should see hottness, novelty, exposure, clicks
  Given Lead named "Lead 1" exists within "Sample category" category
  And lead Lead 1 exists with attributes "clicks_count:17,exposures_count:887"
  And I follow "Sample category"
  Then I should see translated "models.lead.hotness.lvl1"
  And I should see translated "models.lead.novelty.lvl0"
  And I should see "887"
  And I should see "17"

@m3 @tgn @_tested @_done
Scenario: I should be able to click "Add to cart button" that will redirect me to login page
  Given I am signed up and confirmed as user with email johnbuyer3434@person.com and password secret and role customer
  Given Lead named "Lead 392S2" exists within "Sample category" category
  And I follow "Sample category"
  Then I click hidden translated link "leads.index.add_to_cart_link"
  And I should see translated "devise.failure.unauthenticated"
  Then I fill in "user_email" with "johnbuyer3434@person.com"
  And I fill in "user_password" with "secret"
  And I press translated "home.show.view.sign_in"
  Then I should see "Lead 392S2"

@m5 @tgn @_tested
Scenario: If I successfully login after requesting a lead being added to a cart, that lead should be added to cart (or bought if I am big buyer)
  Given I am signed up and confirmed as user with email buyer21@person.com and password supersecret and role customer
  Given lead Great marketing deal exists within category VariousLeads
  And I go to browse leads
  And I follow "VariousLeads"
  And I follow translated "leads.index.add_to_cart_link"
  And I sign in as buyer21@person.com with password supersecret
  And I follow translated "layout.cart.show_cart"
  Then I should see "Great marketing deal"

@m5 @added @lead_templates @tgn @_tested
Scenario: I can see lead template fields with public values for each lead
  Given lead Printers ultimate deal exists within category Computers
  And template named "Printers details" for category "Computers" is created by user "ccagent@person.com" with role "call_centre_agent"
  And template named "Printers details" has following fields "printers protocol:true:false, vendor name:false:false, versions:false:false"
  And template named "Printers details" for lead "Printers ultimate deal" has values "printers protocol:xprinter3, vendor name:Havlett Packard, versions:3983c-39282f"
  And I go to browse leads
  And I follow "Computers"
  Then I should see "PRINTERS DETAILS"
  And I should see "printers protocol"
  And I should see "vendor name"
  And I should see "versions"
  And I should see "Havlett Packard"
  And I should see "3983c-39282f"
  And I should not see "xprinter3"
  And I should see translated "shared.lead_templates.listing.hidden_value"

@m5 @added @lead_templates @tgn @_done @tested_elsewhere
Scenario: I can see only lead template fields' names (not values) for hidden fields