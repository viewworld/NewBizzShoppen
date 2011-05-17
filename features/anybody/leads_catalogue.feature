@lead_catalog @$_guest @m1
Feature: Leads catalogue

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am not sign in
  And lead Printers ultimate deal exists within category Computers
  And lead Printers ultimate deal exists with attributes "creator_name:Jacek Smietana,price:989.39,purchase_value:7843.99,description:Public desc about printers deal,exposures_count:887,clicks_count:17"
  And lead Faxes ultimate deal exists within category Computers
  And lead Monitors ultimate deal exists within category Computers
  And lead Cheap mouses ultimate deal exists within category Computers
  And I have user with email jim.jones@person.com and role agent
  And lead Cheap mouses ultimate deal is created by user jim.jones@person.com with role agent
  And User jim.jones@person.com with role agent is blocked
  And I go to browse leads

@_tested
Scenario: I should see an image and a description for each category
  Then I should see "Computers"

@_tested
Scenario: I can click on a category name and see a list of leads in that category
  Then I follow "Computers"
  And I should see "Printers ultimate deal"

@_tested
Scenario: I should be able to see leads that belong to a user which is blocked
  Then I follow "Computers"
  And I should see "Printers ultimate deal"
  And I should see "Cheap mouses ultimate deal"

@_tested
Scenario: I can browse leads in a given category with pagination
  Given pagination page size for leads is set to 2
  Then I follow "Computers"
  And I follow "2"

@deprecated
Scenario: I should see created by

@m4 @tgn @_tested  @added
Scenario: I should see rating % and certification level for each lead
  Given I have user with email bob@person.com and role customer
  And a lead Printers ultimate deal exists within category Computers and is bought by user bob@person.com with role customer
  And a lead "Printers ultimate deal" has good rating
  Given All leads have refreshed average ratings
  Given I go to browse leads
  And I follow "Computers"
  Then I should see "100%"
  And I should see translated "models.lead.certification.lvl1"

@_tested
Scenario: I should see lead header, lead price, purchase value and public description
  Then I follow "Computers"
  And I should see "989.39"
  And I should see "7,843.99"
  And I should see "Printers ultimate deal"
  And I should see "Public desc about printers deal"

@m4 @tgn @_tested
Scenario: I should see hottness, novelty, exposure, clicks
  When I follow "Computers"
  Then I should see translated "models.lead.hotness.lvl1"
  And I should see translated "models.lead.novelty.lvl0"
  And I should see "887"
  And I should see "17"

@m3 @ao @_done
Scenario: I should see currency in which lead is being sold
  When lead "Printers ultimate deal" has currency "EUR"
  And I follow "Computers"
  And I fill in "search_with_keyword" with "Printers"
  And I press translated "leads.index.search.search_button"
  And I should see "€989.39" within "table"

@m5 @tgn @_tested
Scenario: When you click on a lead that you have not bought, and you are not signed up you should be given the opportunity to sign in or create a new account
  Given Category named "Sample category" already exists
  And Lead named "Lead sample" exists within "Sample category" category
  And I go to browse leads
  And I follow "Sample category"
  Then I click hidden translated link "leads.index.add_to_cart_link"
  And I should see "Sign in"
  Then I follow translated "buyer_home.show.view.create_new_buyer_account"

@m5 @tgn @_tested
Scenario: Add blurb or info text to leads listing "To view lead details click buy lead"
  Given Category named "Sample category" already exists
  And Lead named "Lead sample" exists within "Sample category" category
  And I go to browse leads
  And I follow "Sample category"
  Then I should see "Blurb leads listing"

@m0 @statistics
Scenario: Statistics for exposures and clicks are stored per date

@m10 @requested @_done @_tested
Scenario: I should see tree with category checkboxes beneath the search filter instead of select with categories
    When Category named "HP" already exists within category named "Computers"
    And lead Hapeki exists within category HP
    And I am on the browse leads page
    And I follow "Computers"
    And I should see "Computers" within "table.categories_table"
    And I should see "HP" within "table.categories_table"
    And I should see "Hapeki"

@m10 @requested @_done @_tested
Scenario: I should be able to select categories from different levels of the tree and see their leads
  When there are no leads
  And lead Hapeki exists within category Computers
  And Category named "Japko" already exists within category named "Computers"
  And lead Makbuki exists within category Japko
  And I am on the browse leads page
  And I follow "Computers"
  And I should see "Hapeki"
  And I should see "Makbuki"
  When I uncheck "Japko"
  And I press translated "leads.index.search.search_button"
  Then I should see "Hapeki"
  And I should not see "Makbuki"
  When I check "Japko"
  And I uncheck "Computers"
  And I press translated "leads.index.search.search_button"
  Then I should not see "Hapeki"
  And I should see "Makbuki"
