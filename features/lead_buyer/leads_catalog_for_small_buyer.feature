@lead_catalog @$_small_buyer @m1
Feature: Leads catalog for small buyer

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And lead Printers ultimate deal exists within category Computers
  And lead Printers ultimate deal exists with attributes "creator_name:John Dulinky,price:989.39,purchase_value:7843.99,description:Public desc about printers deal,exposures_count:887,clicks_count:17,currency_id:1"
  And lead Faxes ultimate deal exists within category Computers
  And lead Faxes ultimate deal exists with attributes "currency_id:1"
  And lead Monitors ultimate deal exists within category Computers
  And lead Monitors ultimate deal exists with attributes "currency_id:1"
  And lead Cheap mouses ultimate deal exists within category Computers
  And lead Cheap mouses ultimate deal exists with attributes "currency_id:1"
  And I have user with email jim.jones@person.com and role agent
  And lead Cheap mouses ultimate deal is created by user jim.jones@person.com with role agent
  And User jim.jones@person.com with role agent is blocked
  Given I am signed up and confirmed as user with email john@doe.com and password secret and role supplier
  And I sign in as john@doe.com with password secret
  And I go to browse leads

@_tested
Scenario: I should see an image and a description for each category
  Then I should see "Computers"

@_tested
Scenario: I can click on a category name and see a list of leads in that category
  Then I follow category "Computers"
  And I should see "Printers ultimate deal"

@_tested
Scenario: I should see any leads that belong to a user which is blocked
  Then I follow category "Computers"
  And I should see "Printers ultimate deal"
  And I should see "Cheap mouses ultimate deal"

@_tested
Scenario: I can browse leads in a given category with pagination
  Given pagination page size for leads is set to 2
  Then I follow category "Computers"
  And I follow "2"

@_deprecated
Scenario: I should see created by

@m4 @tgn @_tested @added
Scenario: I should see rating % and certification level for each lead
  Given I have user with email bob@person.com and role supplier
  And a lead Printers ultimate deal exists within category Computers and is bought by user bob@person.com with role supplier
  And a lead "Printers ultimate deal" has good rating
  Given All leads have refreshed average ratings
  Given I go to browse leads
  And I follow category "Computers"
  Then I should see "100%"
  And I should see translated "models.lead.certification.lvl0"

@_tested
Scenario: I should see lead header, lead price, purchase value and public description
  Then I follow category "Computers"
  And I should see "989.39"
  And I should see "7,843.99"
  And I should see "Printers ultimate deal"
  And I should see "Public desc about printers deal"

@m4 @_tested @tgn
Scenario: I should see hottness, novelty, exposure, clicks
  Then I follow category "Computers"
  And I should see translated "models.lead.hotness.lvl1"
  And I should see translated "models.lead.novelty.lvl0"
  And I should see "887"
  And I should see "17"

@_tested
Scenario: I can click add lead to my basket and I will get a notification “Lead was added to your basket”
  Then I follow category "Computers"
  And I follow translated "leads.index.add_to_cart_link" for lead "Printers ultimate deal"
  Then I should see translated "buyer.cart_items.create.flash.cart_item_creation_successful"

@_tested @selenium
Scenario: I can toggle select leads on a displayed page
  Given I go to browse leads
  And I follow category "Computers"
  Then I check "mark_all"

@_tested @selenium
Scenario: I can bulk add leads to my basket and I will get a notification “Leads were added to your basket”
  Given I go to browse leads
  And I follow category "Computers"
  Then I check "mark_all"
  And I press translated "leads.index.button_bulk_create_cart_item"
  Then I should see translated "buyer.bulk_cart_items.create.flash.n_cart_items_added" with options "count:4"

@ao @m5 @added @_done @_tested
Scenario: I should not see leads that I've added to cart
  Given I go to browse leads
  And I follow category "Computers"
  Then I should see "Printers ultimate deal" within ".leads_table"
  And I follow translated "leads.index.add_to_cart_link" for lead "Printers ultimate deal"
  Then I should not see "Printers ultimate deal" within ".leads_table"
  And I should see "Printers ultimate deal" within "#cart_details"
