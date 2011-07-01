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

@_deprecated
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
  And I should see "€989.39" within ".leads_table"

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

# 5768
@m11 @requested @is @_done @_not_testable
Scenario: I can see a certification icon next to lead header if lead is cerified

# 5768
@m11 @requested @is @_done @_not_testable
Scenario: If a linkedin/faceboook url is specified then I can see facebook/linkedin icon next to lead header

# 5767
# remove the icon from the right and put that text instead
@m11 @requested @is @_tested @_done
Scenario: If a lead is certified then I see "Certified by procurement: (yes/no)"
  Given Category named "Sample category" already exists
  And Lead named "Lead sample" exists within "Sample category" category
  And I go to browse leads
  And I follow "Sample category"
  Then I should see translated "leads.listing.certified_by_procurement_label"

# 5766
# the "certification" we have now is about agent's so it should be removed
@m11 @requested @tgn @_tested @_done
Scenario: I should see "Agent's certification" instead of "Certification"
  Given Category named "Sample category" already exists
  And Lead named "Lead sample" exists within "Sample category" category
  And I go to browse leads
  And I follow "Sample category"
  And I should see translated "leads.listing.agent_certification_label"

# 5763
@m11 @requested @tgn @selenium @_tested @_done
Scenario: I can see categories tree when I click advanced search
  Given Category named "Sample category" already exists
  And Category named "Sample category#2" already exists within category named "Sample category"
  And Lead named "Lead sample" exists within "Sample category#2" category
  And I go to browse leads
  And I follow "Sample category"
  And I follow translated "common.advanced_search"
  And I should see "Sample category"
  And I should see "Sample category#2"

# 5762
# do not display other root categories. for examples when you select "Electronics" from browse lead then show categories tree only for Electronics and no other like Business, Leisure etc
@m11 @requested @tgn @selenium @_done @_tested
Scenario: I should see only tree for selected root category
  Given Category named "Sample category" already exists
  And Category named "Sample category#2" already exists within category named "Sample category"
  And Category named "Sample category#3" already exists within category named "Sample category#2"
  And Lead named "Lead sample" exists within "Sample category#2" category
  And Lead named "Lead sample" exists within "Sample category#3" category
  And I go to browse leads
  And I follow "Sample category"
  And I follow translated "common.advanced_search"
  And I should see "Sample category"
  And I should see "Sample category#2"
  And I should see "Sample category#3"
  And I should not see "Computers"
  And I should not see "Business"

@m13 @requested @request_leads @ao @$_guest @_done @_tested
Scenario: I can request a category and more leads for category as a guest
  When there are no leads
  And I follow translated "layout.main_menu.shared.category_request"
  Then I should see translated "category_requests.new.view.header"
  When I go to browse leads
  And I follow "Electronics"
  And I follow translated "leads.index.request_more_leads"
  Then I should see translated "more_leads_requests.new.view.header" with options "category:Electronics"

#6054
# If a category has "0" leads it should display "Sold out" instead.
@m13 @requested @ao @$_guest @_done @_tested
Scenario: I can see "Sold out" message when there are no leads in category
  Given there are no categories
  And Category named "Sample category" already exists
  And Category named "Sample category#2" already exists
  And Lead named "Lead sample" exists within "Sample category#2" category
  And I go to browse leads
  Then I should see translated "layout.main_menu.shared.sold_out" within ".categories_node:nth-of-type(1)"
  And I should not see translated "layout.main_menu.shared.sold_out" within ".categories_node:nth-of-type(2)"

@m14 @requested @$_guest @request_more_leads @ao @_done @_tested
Scenario: I can provide additional information in Note field when requesting more leads for category
  When there are no leads
  And I follow translated "layout.main_menu.shared.category_request"
  Then I should see translated "category_requests.new.view.header"
  When I go to browse leads
  And I follow "Electronics"
  And I follow translated "leads.index.request_more_leads"
  And I fill in "email_template_preview_company_name" with "blah blah company name blah"
  And I fill in "email_template_preview_contact_name" with "blah contact name blah blah"
  And I fill in "email_template_preview_contact_email" with "zorro@zorro.pl"
  And I fill in "email_template_preview_contact_phone" with "blah blah contact phone blah"
  And I fill in "email_template_preview_note" with "blah note blah blah"
  And I press translated "contact_us.new.view.send_email_button"
  And last email sent should have been sent to cc "zorro@zorro.pl"
  And last email sent should have content "blah note blah blah"

@m14 @requested @$_guest @request_more_leads @ao @_done @_tested_elsewhere
Scenario: I should receive copy of the email which is sent when I request more leads for category
