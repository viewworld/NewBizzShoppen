@lead_catalog @$_guest @m1 @faircalls
Feature: Leads catalogue

Background:
  When I am on the homepage
  And I make sure current locale is "en"
  And I am not sign in
  And I visit domain http://faircalls.eu
  And lead Printers ultimate deal exists within category Computers
  And lead Printers ultimate deal exists with attributes "creator_name:Jacek Smietana,price:989.39,purchase_value:7843.99,description:Public desc about printers deal,exposures_count:887,clicks_count:17"
  And lead Faxes ultimate deal exists within category Computers
  And lead Monitors ultimate deal exists within category Computers
  And lead Cheap mouses ultimate deal exists within category Computers
  And I have user with email jim.jones@person.com and role agent
  And lead Cheap mouses ultimate deal is created by user jim.jones@person.com with role agent
  And User jim.jones@person.com with role agent is blocked
  And I go to browse leads

@_tested @_done
Scenario: I should see an image and a description for each category
  Then I should see "Computers"

@_tested @_done
Scenario: I can click on a category name and see a list of leads in that category
  Then I follow category "Computers"
  And I should see "Printers ultimate deal"

@_tested @_done
Scenario: I should be able to see leads that belong to a user which is blocked
  Then I follow category "Computers"
  And I should see "Printers ultimate deal"
  And I should see "Cheap mouses ultimate deal"

@_tested @_done
Scenario: I can browse leads in a given category with pagination
  Given pagination page size for leads is set to 2
  Then I follow category "Computers"
  And I follow "2"

@_deprecated
Scenario: I should see created by

@m4 @tgn @_tested  @added @_done
Scenario: I should see rating % and certification level for each lead
  Given I have user with email bob@person.com and role supplier
  And a lead Printers ultimate deal exists within category Computers and is bought by user bob@person.com with role supplier
  And a lead "Printers ultimate deal" has good rating
  Given All leads have refreshed average ratings
  Given I go to browse leads
  And I follow category "Computers"
  Then I should see "100%"
  And I should see translated "models.lead.certification.lvl1"

@_tested @_done
Scenario: I should see lead header, lead price, purchase value and public description
  Then I follow category "Computers"
  And I should see "989.39"
  And I should see "7,843.99"
  And I should see "Printers ultimate deal"
  And I should see "Public desc about printers deal"

@m4 @tgn @_tested @_done
Scenario: I should see hottness, novelty, exposure, clicks
  When I follow category "Computers"
  Then I should see translated "models.lead.hotness.lvl1"
  And I should see translated "models.lead.novelty.lvl0"
  And I should see "887"
  And I should see "17"

@m3 @ao @_done
Scenario: I should see currency in which lead is being sold
  When lead "Printers ultimate deal" has currency "EUR"
  And I follow category "Computers"
  And I fill in "search_with_keyword" with "Printers"
  And I press translated "leads.index.search.search_button"
  And I should see "€989.39" within ".leads_table"

@m5 @tgn @_tested @_done
Scenario: When you click on a lead that you have not bought, and you are not signed up you should be given the opportunity to sign in or create a new account
  Given Category named "Sample category" already exists
  And I visit domain http://fairleads.eu
  And Lead named "Lead sample" exists within "Sample category" category
  And I go to browse leads
  And I follow category "Sample category"
  Then I click hidden translated link "leads.index.add_to_cart_link"
  And I should see "Sign in"
  Then I follow translated "supplier_home.show.view.create_new_supplier_account"

@m5 @tgn @_tested @_done
Scenario: Add blurb or info text to leads listing "To view lead details click buy lead"
  Given Category named "Sample category" already exists
  And Lead named "Lead sample" exists within "Sample category" category
  And I go to browse leads
  And I follow category "Sample category"
  Then I should see "Blurb leads listing"

@m0 @statistics
Scenario: Statistics for exposures and clicks are stored per date

@m10 @_requested @_done @_tested
Scenario: I should see tree with category checkboxes beneath the search filter instead of select with categories
    When Category named "HP" already exists within category named "Computers"
    And lead Hapeki exists within category HP
    And I am on the browse leads page
    And I follow category "Computers"
    And I should see "Computers" within "table.categories_table"
    And I should see "HP" within "table.categories_table"
    And I should see "Hapeki"

@m10 @_requested @_done @_tested
Scenario: I should be able to select categories from different levels of the tree and see their leads
  When there are no leads
  And lead Hapeki exists within category Computers
  And Category named "Japko" already exists within category named "Computers"
  And lead Makbuki exists within category Japko
  And I am on the browse leads page
  And I follow category "Computers"
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
@m11 @_requested @is @_done @_not_testable
Scenario: I can see a certification icon next to lead header if lead is cerified

# 5768
@m11 @_requested @is @_done @_not_testable
Scenario: If a linkedin/faceboook url is specified then I can see facebook/linkedin icon next to lead header

# 5767
# remove the icon from the right and put that text instead
@m11 @_requested @is @_tested @_done
Scenario: If a lead is certified then I see "Certified by procurement: (yes/no)"
  Given Category named "Sample category" already exists
  And Lead named "Lead sample" exists within "Sample category" category
  And I go to browse leads
  And I follow category "Sample category"
  Then I should see translated "leads.listing.certified_by_member_label"

# 5766
# the "certification" we have now is about agent's so it should be removed
@m11 @_requested @tgn @_tested @_done
Scenario: I should see "Agent's certification" instead of "Certification"
  Given Category named "Sample category" already exists
  And Lead named "Lead sample" exists within "Sample category" category
  And I go to browse leads
  And I follow category "Sample category"
  And I should see translated "leads.listing.agent_certification_label"

# 5763
@m11 @_requested @tgn @selenium @_tested @_done
Scenario: I can see categories tree when I click advanced search
  Given Category named "Sample category" already exists
  And Category named "Sample category#2" already exists within category named "Sample category"
  And Lead named "Lead sample" exists within "Sample category#2" category
  And I go to browse leads
  And I follow category "Sample category"
  And I follow translated "common.advanced_search"
  And I should see "Sample category"
  And I should see "Sample category#2"

# 5762
# do not display other root categories. for examples when you select "Electronics" from browse lead then show categories tree only for Electronics and no other like Business, Leisure etc
@m11 @_requested @tgn @selenium @_done @_tested
Scenario: I should see only tree for selected root category
  Given Category named "Sample category" already exists
  And Category named "Sample category#2" already exists within category named "Sample category"
  And Category named "Sample category#3" already exists within category named "Sample category#2"
  And Lead named "Lead sample" exists within "Sample category#2" category
  And Lead named "Lead sample" exists within "Sample category#3" category
  And I go to browse leads
  And I follow category "Sample category"
  And I follow translated "common.advanced_search"
  And I should see "Sample category"
  And I should see "Sample category#2"
  And I should see "Sample category#3"
  And I should not see "Computers"
  And I should not see "Business"

@m13 @_requested @request_leads @ao @$_guest @_done @_tested @_deprecated
Scenario: I can request a category and more leads for category as a guest
  # When there are no leads
  # And I follow translated "layout.main_menu.shared.category_request"
  # Then I should see translated "category_requests.new.view.header"
  # When I go to browse leads
  # And I follow category "Electronics"
  # And I follow translated "leads.index.request_more_leads"
  # Then I should see translated "more_leads_requests.new.view.header" with options "category:Electronics"

#6054
# If a category has "0" leads it should display "Sold out" instead.
@m13 @_requested @ao @$_guest @_done @_tested @_deprecated
Scenario: I can see "Sold out" message when there are no leads in category
  # Given there are no categories
  # And Category named "Sample category" already exists
  # And Category named "Sample category#2" already exists
  # And Lead named "Lead sample" exists within "Sample category#2" category
  # And I go to browse leads
  # Then I should see translated "layout.main_menu.shared.sold_out" within "#categories_table tbody tr:nth-child(1) td:nth-child(3)"
  # And I should not see translated "layout.main_menu.shared.sold_out" within "#categories_table tbody tr:nth-child(2) td:nth-child(3)"

@m14 @_requested @$_guest @request_more_leads @ao @_done @_tested @_deprecated
Scenario: I can provide additional information in Note field when requesting more leads for category
  # When there are no leads
  # And I follow translated "layout.main_menu.shared.category_request"
  # Then I should see translated "category_requests.new.view.header"
  # When I go to browse leads
  # And I follow category "Electronics"
  # And I follow translated "leads.index.request_more_leads"
  # And I fill in "email_template_preview_company_name" with "blah blah company name blah"
  # And I fill in "email_template_preview_contact_name" with "blah contact name blah blah"
  # And I fill in "email_template_preview_contact_email" with "zorro@zorro.pl"
  # And I fill in "email_template_preview_contact_phone" with "blah blah contact phone blah"
  # And I fill in "email_template_preview_note" with "blah note blah blah"
  # And I press translated "contact_us.new.view.send_email_button"
  # And last email sent should have been sent to cc "zorro@zorro.pl"
  # And last email sent should have content "blah note blah blah"

@m14 @_requested @$_guest @request_more_leads @ao @_done @_tested_elsewhere @_deprecated
Scenario: I should receive copy of the email which is sent when I request more leads for category

# only child (1 level)
@m18 @selenium @_done @_tested @tgn
Scenario: I can see the dropdown menu of subcategories on the particular category leads listing
  Given Category Sound files is created
  And Category named "Podcasts" already exists within category named "Sound files"
  And Category named "Music" already exists within category named "Sound files"
  And Category named "Scientific" already exists within category named "Podcasts"
  And Category named "Comedy" already exists within category named "Podcasts"
  Then Lead named "Various music" exists within "Music" category
  Then Lead named "Various podcasts" exists within "Podcasts" category
  Then Lead named "Skeptical Guide To Universe" exists within "Scientific" category
  Then Lead named "Funny pod" exists within "Comedy" category
  When I go to browse leads
  And I follow category "Sound files"
  And "category_selector" dropdown should have values "Podcasts,Music"
  And I select "Podcasts" from "category_selector"
  And "category_selector" dropdown should have values "Scientific,Comedy"
  And I should see "Various podcasts"
  And I select "Scientific" from "category_selector"
  And I should see "Skeptical Guide To Universe"

@m18 @selenium @_tested @_done @tgn
Scenario: I should see "View all" by the pagination links under Browse leads
  Given pagination page size for leads is set to 2
  And I follow category "Computers"
  And I follow translated "common.show_all"
  And I should see "Printers ultimate deal"
  And I should see "Faxes ultimate deal"
  And I should see "Monitors ultimate deal"
  And I should see "Cheap mouses ultimate deal"
  And I follow translated "common.show_paginated"
