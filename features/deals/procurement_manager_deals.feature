@m16 @procurement_manager_deals @requested @_deals @$_procurement_manager
Feature: Deals from procurement manager perspective

  Background:
    Given I am signed up and confirmed as user with email procurment@nbs.com and password secret and role purchase_manager
    And I am on the homepage
    And I make sure current locale is "en"
    Then I sign in as procurment@nbs.com with password secret

  @_tested @_done @tgn
  Scenario: I should see "My deals" tab instead of "My leads"
    Then I should see translated "layout.main_menu.purchase_manager.my_requests"
    And I should not see "My leads"

  @_tested @_done @tgn
  Scenario: I can "Browse deals" instead of "Browse leads"
    Then I should see translated "layout.main_menu.shared.browse_deals"
    And I should not see "Browse leads"

  @m18 @selenium @_done @_tested @tgn
  Scenario: I should see "View all" by the pagination links under Browse deals
    Given pagination page size for leads is set to 2
    And a deal named "Some deal #1" exists within category "Electronics deals"
    And a deal named "Some deal #2" exists within category "Electronics deals"
    And a deal named "Some deal #3" exists within category "Electronics deals"
    And a deal named "Some deal #4" exists within category "Electronics deals"
    Then I follow translated "layout.main_menu.shared.browse_deals"
    And I follow "Electronics deals"
    And I follow translated "common.show_all"
    And I should see "Some deal #1"
    And I should see "Some deal #2"
    And I should see "Some deal #3"
    And I should see "Some deal #4"
    And I follow translated "common.show_paginated"

  # only child (1 level)
  @m18 @selenium @_done @_tested @tgn
  Scenario: I can see the dropdown menu of subcategories on the particular category leads listing
    Given Deal category Sound files is created
    And Deal category named "Podcasts" already exists within category named "Sound files"
    And Deal category named "Music" already exists within category named "Sound files"
    And Deal category named "Scientific" already exists within category named "Podcasts"
    And Deal category named "Comedy" already exists within category named "Podcasts"
    Given a deal named "Some deal #1" exists within category "Electronics deals"
    Then a deal named "Various music" exists within category "Music"
    Then a deal named "Various podcasts" exists within category "Podcasts"
    Then a deal named "Skeptical Guide To Universe" exists within category "Scientific"
    Then a deal named "Funny pod" exists within category "Comedy"
    Then I follow translated "layout.main_menu.shared.browse_deals"
    And I follow "Sound files"
    And "category_selector" dropdown should have values "Podcasts,Music"
    And I select "Podcasts" from "category_selector"
    And "category_selector" dropdown should have values "Scientific,Comedy"
    And I should see "Various podcasts"
    And I select "Scientific" from "category_selector"
    And I should see "Skeptical Guide To Universe"

  @_tested @_done @tgn
  Scenario: I can see list of deals categories and subcategories
    Then I follow translated "layout.main_menu.shared.browse_deals"
    And I should see "Electronics deals"

  @_tested @_done @tgn
  Scenario: I can browse deals in seelcted category
    Given a deal named "Some deal #1" exists within category "Electronics deals"
    Then I follow translated "layout.main_menu.shared.browse_deals"
    And I follow "Electronics deals"
    Then I should see "Some deal #1"

  @_done @tested_elsewhere @tgn
  Scenario: I can see "My requests" instead of "My leads"

  @_done @_tested @tgn
  Scenario: I can't create new lead
    When I follow translated "layout.main_menu.purchase_manager.my_requests"
    And I should not see "New lead"

  @_done @_tested @tgn
  Scenario: I should see "Latest Deals" instead of "Best Sellers"
    When I follow translated "layout.main_menu.shared.home"
    Then I should see translated "purchase_manager_home.show.view.header_latest_deals"
    And I should not see "Best sellers"

  @_done @_tested @tgn @_deprecated
  Scenario: I can see contact information for deals when I am logged in
    Given a deal named "Some deal #1" exists within category "Electronics deals"
    #Given a deal named "Some deal #1" exists with attributes "contact_name:SE Cupps"
    Given a deal named "Some deal #1" exists with attributes "company_name:SE Cupps"
    Then I follow translated "layout.main_menu.shared.browse_deals"
    And I follow "Electronics"
    #Then I should see translated "deals.listing.contact_label"
    #And I should see translated "deals.listing.contact_name_label"
    And I should see "SE Cupps"

  @_done @_tested @tgn
  Scenario: I can click "Contact me"
    Given a deal named "Some deal #1" exists within category "Electronics deals"
    Then I follow translated "layout.main_menu.shared.browse_deals"
    And I follow "Electronics"
    Then I should see translated "deals.index.view.view_deal"

  #tested under sales manager deals
  @_done @tgn @tested_elsewhere
  Scenario: When I click "Contact me" I can enter "Additional" template information and note field

  @_done @_tested @tgn @added @m18
  Scenario: When I sign up on fairdeals.dk/eu and confirmation is turned off I should still get email and be signed in afterword
  Given setting for "email_verification_for_procurement_managers" is set to "0"
  Given I visit domain http://fairdeals.dk
  And I follow translated "fairdeals_home.show.view.get_free_account"
  And I fill in "user_purchase_manager_company_name" with "The Young Tturks"
  And I fill in "user_purchase_manager_first_name" with "Ana"
  And I fill in "user_purchase_manager_last_name" with "Kasparian"
  And I fill in "user_purchase_manager_address_attributes_address_line_1" with "2222"
  And I fill in "user_purchase_manager_address_attributes_address_line_2" with "2222"
  And I fill in "user_purchase_manager_address_attributes_address_line_3" with "2222"
  And I fill in "user_purchase_manager_address_attributes_zip_code" with "2222"
  And I fill in "user_purchase_manager_screen_name" with "Ana Kasparian"
  And I fill in "user_purchase_manager_phone" with "+44 325423454"
  And I fill in "user_purchase_manager_password" with "secret"
  And I fill in "user_purchase_manager_password_confirmation" with "secret"
  And I fill in "user_purchase_manager_email" with "anakasparian@tyt.com"
  And I check "user_purchase_manager_agreement_read"
  And I press translated "purchase_manager_accounts.new.view.button_create_account"
  And I should be signed in
  And last email sent should have been sent to recipient "anakasparian@tyt.com"

  ##7659
  @m19 @requested @_done @_tested @tgn
  Scenario: When I am not logged in I should still see Get deal button and when click I should be prompted to log in or create new account and return to the get deal
    Given I visit domain http://fairdeals.dk
    Given user buyer@nbs.com with role customer exists with attributes "company_name:Xeper"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I follow translated "buyer_home.show.view.create_new_membership_account"
    And I fill in "user_purchase_manager_company_name" with "The Young Turks"
    And I fill in "user_purchase_manager_first_name" with "Ana"
    And I fill in "user_purchase_manager_last_name" with "Kasparian"
    And I fill in "user_purchase_manager_address_attributes_address_line_1" with "2222"
    And I fill in "user_purchase_manager_address_attributes_address_line_2" with "2222"
    And I fill in "user_purchase_manager_address_attributes_address_line_3" with "2222"
    And I fill in "user_purchase_manager_address_attributes_zip_code" with "2222"
    And I fill in "user_purchase_manager_screen_name" with "Ana Kasparian"
    And I fill in "user_purchase_manager_phone" with "+44 325423454"
    And I fill in "user_purchase_manager_password" with "secret"
    And I fill in "user_purchase_manager_password_confirmation" with "secret"
    And I fill in "user_purchase_manager_email" with "anakasparian@tyt.com"
    And I check "user_purchase_manager_agreement_read"
    And I press translated "purchase_manager_accounts.new.view.button_create_account"
    And I should see translated "deals.new.view.frame_header"


  #7531
  @m19 @requested @_done @_tested @tgn
  Scenario: When I get deal then I should get the email with all deal information and all materials included as attachments
    Given I visit domain http://fairdeals.dk
    Given user buyer@nbs.com with role customer exists with attributes "company_name:Xeper"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:software components|description:short desc about software|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper"
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role purchase_manager
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "some hidden note"
    And I press translated "purchase_manager.leads.new.view.button_create"
    And I press translated "purchase_manager.leads.show.view.ok_confirmation"
    And last email sent should have been sent to recipient "purchase_manager101@nbs.com"
    And last email sent should have subject "You have requested a deal"
    And last email sent should have content "software components"
    And last email sent should have content "short desc about software"


  #7531
  @m19 @requested @_done @_tested @tgn
  Scenario: Email with deal information for procurment manager should be customizable per deal (with default template)
    Given I am not sign in
    And I make sure current locale is "da"
    Given user buyer@nbs.com with role customer exists with attributes "company_name:Xeper"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:software components|description:short desc about software|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper"
    And I am on the homepage
    And I sign in as buyer@nbs.com with password secret
    And I follow translated "layout.main_menu.lead_buyer.my_deals"
    And I follow translated "buyer.deals.index.view.edit"
    And I follow translated "buyer.deals.edit.view.edit_deal_request_details_email_template"
    And I fill in "email_template_subject" with "Customized You got the deal"
    And I fill in "email_template_body_editor" with "Customized email for {{deal.header}}"
    And I press translated "campaigns.email_templates.edit.view.button_update"
    Given I visit domain http://fairdeals.dk
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role purchase_manager
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    And User purchase_manager101@nbs.com with role purchase_manager is from country Denmark
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "some hidden note"
    And I press translated "purchase_manager.leads.new.view.button_create"
    And I press translated "purchase_manager.leads.show.view.ok_confirmation"
    And last email sent should have been sent to recipient "purchase_manager101@nbs.com"
    And last email sent should have subject "Customized You got the deal"
    And last email sent should have content "Customized email for software components"

  #7530
  @m20 @requested @tgn
  Scenario: When deal is requested the deal code is included as the first info in lead's hidden description and it is visible when member wants to get the deal
