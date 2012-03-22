@m16 @procurement_manager_deals @_requested @_deals @$_procurement_manager
Feature: Deals from procurement manager perspective

  Background:
    Given I am signed up and confirmed as user with email procurment@nbs.com and password secret and role member
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10"
    And subscription plan has following lines
      | name                 | price |
      | subscr premium line1 |    99 |
    And user with email "procurment@nbs.com" upgrades to subscription named "Premium member"
    And I am on the homepage
    And I make sure current locale is "en"
    And I visit domain http://fairdeals.eu
    Then I sign in as procurment@nbs.com with password secret

  @_tested @_done @tgn
  Scenario: I should see "My deals" tab instead of "My leads"
    Then I should see translated "layout.main_menu.member.my_requests"
    And I should not see "My leads"

  @_tested @_done @tgn
  Scenario: I can "Browse deals" instead of "Browse leads"
    Then I should see translated "layout.fairdeals.main_menu.deals"
    And I should not see "Browse leads"

  @m18 @selenium @_done @_tested @tgn
  Scenario: I should see "View all" by the pagination links under Browse deals
    Given pagination page size for leads is set to 2
    And a deal named "Some deal #1" exists within category "Electronics deals"
    And a deal named "Some deal #2" exists within category "Electronics deals"
    And a deal named "Some deal #3" exists within category "Electronics deals"
    And a deal named "Some deal #4" exists within category "Electronics deals"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    And I follow translated "common.show_all"
    And I should see "Some deal #1"
    And I should see "Some deal #2"
    And I should see "Some deal #3"
    And I should see "Some deal #4"
    And I follow translated "common.show_paginated"

  # only child (1 level)
  @m18 @selenium @_done @_tested @tgn @_deprecated
  Scenario: I can see the dropdown menu of subcategories on the particular category leads listing
#    Given Deal category Sound files is created
#    And Deal category named "Podcasts" already exists within category named "Sound files"
#    And Deal category named "Music" already exists within category named "Sound files"
#    And Deal category named "Scientific" already exists within category named "Podcasts"
#    And Deal category named "Comedy" already exists within category named "Podcasts"
#    Given a deal named "Some deal #1" exists within category "Electronics deals"
#    Then a deal named "Various music" exists within category "Music"
#    Then a deal named "Various podcasts" exists within category "Podcasts"
#    Then a deal named "Skeptical Guide To Universe" exists within category "Scientific"
#    Then a deal named "Funny pod" exists within category "Comedy"
#    Then I follow translated "layout.fairdeals.main_menu.deals"
#    And I follow category "Sound files"
#    And "category_selector" dropdown should have values "Podcasts,Music"
#    And I select "Podcasts" from "category_selector"
#    And "category_selector" dropdown should have values "Scientific,Comedy"
#    And I should see "Various podcasts"
#    And I select "Scientific" from "category_selector"
#    And I should see "Skeptical Guide To Universe"

  @_tested @_done @tgn
  Scenario: I can see list of deals categories and subcategories
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I should see "Electronics deals"

  @_tested @_done @tgn
  Scenario: I can browse deals in seelcted category
    Given a deal named "Some deal #1" exists within category "Electronics deals"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    Then I should see "Some deal #1"

  #10031
  @m29 @_requested @tgn @_done @_non_testable
  Scenario: When I browse deals in category the layout should have right column as on home page / all deals

  @_done @tested_elsewhere @tgn
  Scenario: I can see "My requests" instead of "My leads"

  @_done @_tested @tgn
  Scenario: I can't create new lead
    When I follow translated "layout.main_menu.member.my_requests"
    And I should not see "New lead"

  # removed from fairdeals home page
  @_done @_tested @tgn @_deprecated
  Scenario: I should see "Latest Deals" instead of "Best Sellers"
#    When I follow translated "layout.main_menu.shared.home"
#    Then I should see translated "supplier_home.show.view.header_latest_deals"
#    And I should not see "Best sellers"

  @_done @_tested @tgn @_deprecated
  Scenario: I can see contact information for deals when I am logged in
#    Given a deal named "Some deal #1" exists within category "Electronics deals"
#    #Given a deal named "Some deal #1" exists with attributes "contact_name:SE Cupps"
#    Given a deal named "Some deal #1" exists with attributes "company_name:SE Cupps"
#    Then I follow translated "layout.main_menu.shared.browse_deals"
#    And I follow category "Electronics deals"
#    #Then I should see translated "deals.listing.contact_label"
#    #And I should see translated "deals.listing.contact_name_label"
#    And I should see "SE Cupps"

  @_done @_tested @tgn
  Scenario: I can click "Contact me"
    Given a deal named "Some deal #1" exists within category "Electronics deals"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    Then I should see translated "deals.index.view.view_deal"

  #tested under sales manager deals
  @_done @tgn @tested_elsewhere
  Scenario: When I click "Contact me" I can enter "Additional" template information and note field

  @_done @_tested @tgn @added @m18
  Scenario: When I sign up on fairdeals.dk/eu and confirmation is turned off I should still get email and be signed in afterword
  Given setting for "email_verification_for_members" is set to "0"
  Given I visit domain http://fairdeals.dk
  And I follow translated "fairdeals_home.show.view.get_free_account"
  And I fill in "user_member_company_name" with "The Young Tturks"
  And I fill in "user_member_first_name" with "Ana"
  And I fill in "user_member_last_name" with "Kasparian"
  And I fill in "user_member_address_attributes_address_line_1" with "2222"
  And I fill in "user_member_address_attributes_address_line_2" with "2222"
  And I fill in "user_member_address_attributes_address_line_3" with "2222"
  And I fill in "user_member_address_attributes_zip_code" with "2222"
  And I fill in "user_member_phone" with "+44 325423454"
  And I fill in "user_member_password" with "secret"
  And I fill in "user_member_password_confirmation" with "secret"
  And I fill in "user_member_email" with "anakasparian@tyt.com"
  And I check "user_member_agreement_read"
  And I choose "user_member_subscription_plan_id"
  And I press translated "supplier_accounts.new.view.button_create_account"
  And I should be signed in
  And last email sent should have been sent to recipient "anakasparian@tyt.com"

  ##7659
  @m19 @_requested @_done @_tested @tgn @selenium
  Scenario: When I am not logged in I should still see Get deal button and when click I should be prompted to log in or create new account and return to the get deal
    Given I visit domain http://fairdeals.dk
    And subscription plan named "Free member subscription" exists with attributes "free_deal_requests_in_free_period:100"
    Given user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    Given template named "Xeper details" for category "Xeper" is created by user "buyer@nbs.com" with role "supplier"
    And template named "Xeper details" is mandatory
    And template named "Xeper details" has following fields "field #1:true:true,field #2:true:true"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper"
    And deal named "super" has deal template "Xeper details" assigned
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I wait 2 second
    And I fill in "user_member_company_name" with "The Young Turks"
    And I fill in "user_member_first_name" with "Ana"
    And I fill in "user_member_last_name" with "Kasparian"
    And I fill in "user_member_address_attributes_address_line_1" with "2222"
    And I fill in "user_member_address_attributes_address_line_2" with "2222"
    And I fill in "user_member_address_attributes_address_line_3" with "2222"
    And I fill in "user_member_address_attributes_zip_code" with "2222"
    And I fill in "user_member_phone" with "+44 325423454"
    And I fill in "user_member_password" with "secret"
    And I fill in "user_member_password_confirmation" with "secret"
    And I fill in "user_member_email" with "anakasparian@tyt.com"
    And I check "user_member_agreement_read"
    And I press translated "supplier_accounts.new.view.button_create_account"
    And I wait 2 second
    And I fill in "lead_lead_template_values_attributes_0_value" with "some value1"
    And I fill in "lead_lead_template_values_attributes_1_value" with "some value2"
    And I press translated "member.leads.new.view.button_create"
    And I press translated "member.leads.show.view.ok_confirmation"
    And I should see "super"
    And I am not sign in
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:ultradeal|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper"
    And deal named "ultradeal" has deal template "Xeper details" assigned
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow "ultradeal"
    And I follow translated "deals.index.view.contact_me"
    And I wait 2 second
    And I fill in "user_email" with "anakasparian@tyt.com"
    And I fill in "user_password" with "secret"
    And I press translated "home.show.view.sign_in"
    And I wait 2 second
    And I fill in "lead_lead_template_values_attributes_0_value" with "some value1"
    And I fill in "lead_lead_template_values_attributes_1_value" with "some value2"
    And I press translated "member.leads.new.view.button_create"
    And I press translated "member.leads.show.view.ok_confirmation"
    And I should see "ultradeal"

  #8340
  @m22 @_requested @tgn @_done @_tested
  Scenario: When I have free subscription and I click get deal then I should see questions if I want to upgrade
    Given I am not sign in
    Given I visit domain http://fairdeals.dk
    And I am signed up and confirmed as user with email procurmentfree@nbs.com and password secret and role member
    And I sign in as procurmentfree@nbs.com with password secret
    Given user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:ultimate some funky deal|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    Then I should see translated "deals.index.view.upgrade_subscription_to_get_deal"
    And I follow translated "deals.index.view.upgrade_subscription_to_get_deal"
    And I should be on my profile
    Then I follow translated "subscriptions.listing.upgrade"
    And I should see "ultimate some funky deal"
    And I follow translated "deals.index.view.contact_me"

  #8340
  @m22 @_requested @tgn @_done @_tested_elsewhere
  Scenario: When I try to get deal on free subscription and I decide to upgrade then I should be redirected to my profile page

  #7531
  @m19 @_requested @_done @_tested @tgn
  Scenario: When I get deal then I should get the email with all deal information and all materials included as attachments
    Given I visit domain http://fairdeals.dk
    Given user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And user "buyer@nbs.com" has deal maker role enabled
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:software components|description:short desc about software|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper"
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10"
    And user with email "purchase_manager101@nbs.com" upgrades to subscription named "Premium member"
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_company_name" with "The Young Turks"
    And I fill in "lead_contact_name" with "Ana Kasparian"
    And I fill in "lead_hidden_description" with "some hidden note"
    And I should not see "Facebook"
    And I should not see "Linkedin"
    And I press translated "member.leads.new.view.button_create"
    And I press translated "member.leads.show.view.ok_confirmation"
    And last email sent should have been sent to recipient "purchase_manager101@nbs.com"
    And last email sent should have subject "You have requested a deal"
    And last email sent should have content "software components"
    And last email sent should have content "short desc about software"

  #7531
  @m19 @_requested @_done @_tested @tgn
  Scenario: Email with deal information for procurment manager should be customizable per deal (with default template)
    Given I am not sign in
    And I visit domain http://fairleads.eu
    And I make sure current locale is "da"
    Given user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And user "buyer@nbs.com" has deal maker role enabled
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:software components|description:short desc about software|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper"
    And I am on the homepage
    And I sign in as buyer@nbs.com with password secret
    And I follow translated "layout.main_menu.lead_supplier.my_deals"
    And I follow translated "supplier.deals.index.view.edit"
    And I follow translated "supplier.deals.edit.view.edit_deal_request_details_email_template"
    And I fill in "email_template_subject" with "Customized You got the deal"
    And I fill in "email_template_body_editor" with "Customized email for {{deal.header}}"
    And I press translated "campaigns.email_templates.edit.view.button_update"
    Given I visit domain http://fairdeals.dk
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10"
    And user with email "purchase_manager101@nbs.com" upgrades to subscription named "Premium member"
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    And User purchase_manager101@nbs.com with role member is from country Denmark
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "some hidden note"
    And I press translated "member.leads.new.view.button_create"
    And I press translated "member.leads.show.view.ok_confirmation"
    And last email sent should have been sent to recipient "purchase_manager101@nbs.com"
    And last email sent should have subject "Customized You got the deal"
    And last email sent should have content "Customized email for software components"

  @m20 @_requested @tgn @_tested @_done
  Scenario: When deal is requested the deal code is included as the first info in lead's hidden description and it is visible when member wants to get the deal
    Given I visit domain http://fairdeals.dk
    Given user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And user "buyer@nbs.com" has deal maker role enabled
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:software components|description:short desc about software|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper|deal_code:CODE4D3AL"
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10"
    And user with email "purchase_manager101@nbs.com" upgrades to subscription named "Premium member"
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "some hidden note"
    And I press translated "member.leads.new.view.button_create"
    And lead "A company is interested in software components" should have the following deal code "CODE4D3AL"
    And I press translated "member.leads.show.view.ok_confirmation"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And I should see "CODE4D3AL"

  @m21 @_requested @_done @_tested @ao
  Scenario: When I get deal the direct phone number should be populated from my profile
    Given I visit domain http://fairdeals.dk
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And user "buyer@nbs.com" has deal maker role enabled
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:software components|description:short desc about software|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper|deal_code:CODE4D3AL"
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
    And user "purchase_manager101@nbs.com" with role "member" has attributes "direct_phone_number:48601101101"
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10"
    And user with email "purchase_manager101@nbs.com" upgrades to subscription named "Premium member"
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    Then the "lead_direct_phone_number" field should contain "48601101101"

  @m21 @_requested @_done @_tested @ao @_deprecated
  Scenario: When I get deal the facebook url should contain profile link if my account is linked to facebook
#    Given I visit domain http://fairdeals.dk
#    And I am not sign in
#    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
#    And user "buyer@nbs.com" has deal maker role enabled
#    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:software components|description:short desc about software|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper|deal_code:CODE4D3AL"
#    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
#    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10"
#    And user with email "purchase_manager101@nbs.com" upgrades to subscription named "Premium member"
#    And user "purchase_manager101@nbs.com" with role "member" has attributes "rpx_identifier:www.facebook.com/profile/123"
#    Then I sign in as purchase_manager101@nbs.com with password supersecret
#    Then I follow translated "layout.fairdeals.main_menu.deals"
#    And I follow category "Business deals"
#    And I follow translated "deals.index.view.view_deal"
#    And I follow translated "deals.index.view.contact_me"
#    Then the "lead_facebook_url" field should contain "www.facebook.com/profile/123"

  @m21 @_requested @_done @_tested @ao @_deprecated
  Scenario: When I get deal the linkedin url should contain profile link if my account is linked to linkedin
#    Given I visit domain http://fairdeals.dk
#    And I am not sign in
#    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
#    And user "buyer@nbs.com" has deal maker role enabled
#    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:software components|description:short desc about software|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper|deal_code:CODE4D3AL"
#    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
#    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10"
#    And user with email "purchase_manager101@nbs.com" upgrades to subscription named "Premium member"
#    And user "purchase_manager101@nbs.com" with role "member" has attributes "rpx_identifier:www.linkedin.com/profile/123"
#    Then I sign in as purchase_manager101@nbs.com with password supersecret
#    Then I follow translated "layout.fairdeals.main_menu.deals"
#    And I follow category "Business deals"
#    And I follow translated "deals.index.view.view_deal"
#    And I follow translated "deals.index.view.contact_me"
#    Then the "lead_linkedin_url" field should contain "www.linkedin.com/profile/123"

  #8339
  @m22 @_requested @ao @_done @_tested
  Scenario: I should not see activation dates on the listing and only deals with valid dates should be displayed
    Given a deal named "Some deal #1" exists within category "Electronics deals"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    Then I should not see "Activation"

  #8606
  @m23 @_requested @tgn @_done @_tested
  Scenario: I can see a blurb text when I confirm a deal
    Given I visit domain http://fairdeals.dk
    And I am not sign in
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And user "buyer@nbs.com" has deal maker role enabled
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:software components|description:short desc about software|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper|deal_code:CODE4D3AL"
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10"
    And user with email "purchase_manager101@nbs.com" upgrades to subscription named "Premium member"
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I press translated "member.leads.new.view.button_create"
    And I should see "Blurb voucher confirmation page"

  #9606
  @m27 @_requested @tgn @_done @_tested_elsewhere
  Scenario: When I am not signed in and I click get deal button then modal window should appear

  #9606
  @m27 @_requested @tgn @_done @_tested_elsewhere
  Scenario: It should be possible to sign in or sign up on the modal window view

  #9606
  @m27 @_requested @tgn @_done @_tested_elsewhere
  Scenario: After sign in/up I should see another modal windows where I can enter template information and note

  #9606
  @m27 @_requested @tgn @_done @_tested_elsewhere
  Scenario: I should be redirected to paypal or view deal after completing the modal window form

  #9410
  @m27 @_requested @tgn @_done @_tested
  Scenario: I can get deal when I have free subscription and I didn't used up my limit of free deals
    And subscription plan named "Free member subscription" exists with attributes "free_deal_requests_in_free_period:2"
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
    And I sign out
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    Given a deal named "FreeDeal001" exists within category "Electronics deals"
    And a deal named "FreeDeal001" exists with attributes "published:1,premium_deal:0"
    Given a deal named "FreeDeal002" exists within category "Electronics deals"
    And a deal named "FreeDeal002" exists with attributes "published:1,premium_deal:0"
    Given a deal named "FreeDeal003" exists within category "Electronics deals"
    And a deal named "FreeDeal003" exists with attributes "published:1,premium_deal:0"
    Given a deal named "PremiumDeal001" exists within category "Electronics deals"
    And a deal named "PremiumDeal001" exists with attributes "published:1,premium_deal:1"

    And I fill in "search_with_keyword" with "PremiumDeal001"
    And I press translated "layout.fairdeals.main_menu.search"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.upgrade_subscription_to_get_deal"
    And I should be on my profile
    And I fill in "search_with_keyword" with "FreeDeal001"
    And I press translated "layout.fairdeals.main_menu.search"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I press translated "member.leads.new.view.button_create"
    And I should see "Blurb voucher confirmation page"
    And I fill in "search_with_keyword" with "FreeDeal002"
    And I press translated "layout.fairdeals.main_menu.search"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I press translated "member.leads.new.view.button_create"
    And I should see "Blurb voucher confirmation page"
    And I fill in "search_with_keyword" with "FreeDeal003"
    And I press translated "layout.fairdeals.main_menu.search"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.upgrade_subscription_to_get_deal"
    And I should be on my profile

  #9397
  @m27 @_requested @tgn @_done @_tested
  Scenario: When I get the deal with voucher and my payment from paypal haven't come yet then I should not see that deal under my deals
    And I visit domain http://fairdeals.eu
    And I am not sign in
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:software components|description:short desc about software|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper|deal_code:CODE4D3AL|voucher_enabled:true|voucher_until_type:1|deal_price:2|discounted_price:1|voucher_max_number:3|voucher_how_to_redeem:you can redeem it by calling me"
    Then voucher number with index "0" for deal "software components" has number "000000001" and state "new"
    And I am signed up and confirmed as user with email translator_purchase_manager@nbs.com and password supersecret and role member
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10,billing_cycle:10"
    And user with email "translator_purchase_manager@nbs.com" upgrades to subscription named "Premium member"
    And I sign in as translator_purchase_manager@nbs.com with password secret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    Then I should see "software components"
    Then I follow translated "deals.index.view.view_deal"
    Then I follow translated "deals.index.view.contact_me"
    And I press translated "member.leads.new.view.button_create"
    Then I press translated "member.leads.show.view.go_to_paypal"
    Then I should see "redirecting to paypal, please wait..."
    #it should not be visible before payment under my deals
    Then I follow translated "layout.fairdeals.main_menu.member.my_requests"
    And I should not see "software components"
    #Get deal button should not be available until the payment is cancelled
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    Then I should see "software components"
    Then I follow translated "deals.index.view.view_deal"
    And I should not see translated "deals.index.view.contact_me"
    #check paypal response
    Then paypal voucher payment succeeded for deal "software components" and user with email "translator_purchase_manager@nbs.com" and role "member"
    Then last email sent should have been sent to recipient "translator_purchase_manager@nbs.com"
    Then last email sent should have subject "You have new voucher"
    #check displaying
    Then I follow translated "layout.fairdeals.main_menu.member.my_requests"
    And I follow translated "member.leads.index.view.show"
    And I should see "you can redeem it by calling me"
    Then I should see translated "member.leads.edit.view.voucher_label"
    Then I follow translated "member.leads.edit.view.voucher_link"

  #9397
  @m27 @_requested @tgn @_done @_tested_elsewhere
  Scenario: When I get the deal with voucher and my payment from paypal was successful then my request should be visible under My deals

  #9397
  @m27 @_requested @tgn @_done @_tested
  Scenario: When my request is cancelled I get email "Sorry your voucher is canceled since the payment did not go through.Please try again or contact fairleads if the problem persists"
    And I visit domain http://fairdeals.eu
    And I am not sign in
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:software components|description:short desc about software|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper|deal_code:CODE4D3AL|voucher_enabled:true|voucher_until_type:1|deal_price:2|discounted_price:1|voucher_max_number:3|voucher_how_to_redeem:you can redeem it by calling me"
    Then voucher number with index "0" for deal "software components" has number "000000001" and state "new"
    And I am signed up and confirmed as user with email translator_purchase_manager@nbs.com and password supersecret and role member
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10,billing_cycle:10"
    And user with email "translator_purchase_manager@nbs.com" upgrades to subscription named "Premium member"
    And I sign in as translator_purchase_manager@nbs.com with password secret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    Then I should see "software components"
    Then I follow translated "deals.index.view.view_deal"
    Then I follow translated "deals.index.view.contact_me"
    And I press translated "member.leads.new.view.button_create"
    Then I press translated "member.leads.show.view.go_to_paypal"
    Then I should see "redirecting to paypal, please wait..."
    #check paypal response
    Then paypal voucher payment failed for deal "software components" and user with email "translator_purchase_manager@nbs.com" and role "member"
    Then last email sent should have been sent to recipient "translator_purchase_manager@nbs.com"
    Then last email sent should have subject "Payment failed for voucher from deal software components"
    #check displaying
    Then I follow translated "layout.fairdeals.main_menu.member.my_requests"
    And I should not see "software components"
    #Get deal button should be available until the payment is cancelled
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    Then I should see "software components"
    Then I follow translated "deals.index.view.view_deal"
    And I should see translated "deals.index.view.contact_me"

  #9367
  @m27 @_requested @tgn @_done @_tested_elsewhere
  Scenario: When I get the deal on the page for deal request I should not see linkedin/facebook urls but see company name

  #9811
  @m27 @_requested @tgn @_done @_tested
  Scenario: I can get a Premium deal only if I am signed in as member and have subscription that allows getting Premium deals
    Given I am on the homepage
    Given a deal named "PrimaryDeal" exists within category "Electronics deals"
    And a deal named "PrimaryDeal" exists with attributes "published:1,premium_deal:1"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.upgrade_subscription_to_get_deal"
    And I should be on my profile
    Given user "procurment@nbs.com" has premium deals enabled
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I press translated "member.leads.new.view.button_create"
    And I should see "Blurb voucher confirmation page"

  #9988
  @m28 @_requested @tgn @_done @_tested
  Scenario: I should not see short description when getting a deal
    Given user "procurment@nbs.com" has premium deals enabled
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "premium_deal:1|description:short description1|published:1|header:deal001|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow "deal001"
    And I follow translated "deals.index.view.contact_me"
    And I should not see "short description1"
    And I should see translated "deals.index.view.premium_deal_splash_label"

  #9987
  @m28 @_requested @rb @_done @_tested_elsewhere
  Scenario: I should see splash image when getting premium deal

  #9976
  @m28 @_requested @tgn @_done @_tested @selenium
  Scenario: I should see the amount of secondary deals specified by admin on fairdeals home page
  Given a deal named "deal000" exists within category "Electronics deals"
  Given a deal named "deal001" exists within category "Electronics deals"
  And a deal named "deal002" exists within category "Electronics deals"
  And a deal named "deal003" exists within category "Electronics deals"
  And a deal named "deal004" exists within category "Electronics deals"
  And a deal named "deal005" exists within category "Electronics deals"
  Given deal named "deal000" is a primary featured deal
  And deal named "deal001" is "1" secondary featured deal
  And deal named "deal002" is "2" secondary featured deal
  And deal named "deal003" is "3" secondary featured deal
  And deal named "deal004" is "4" secondary featured deal
  And deal named "deal005" is "5" secondary featured deal
  And setting for "number_of_secondary_featured_deals" is set to "4"
  And I am on the homepage
  And I should see "deal001"
  And I should see "deal002"
  And I should see "deal003"
  And I should see "deal004"
  And I should see "4" occurrences of css class "secondary_featured_deal" for tag "div"

  #9981
  @m28 @_requested @tgn @_done @_non_testable
  Scenario: I should not see JS dialog when I try to get a deal and dont have permission

  #9981
  @m28 @_requested @tgn @_done @_tested
  Scenario: If I dont have permission to get deal the button should state "Upgrade subscription" instead of "Get deal"
    Given I visit domain http://fairdeals.dk
    And subscription plan named "Free member subscription" exists with attributes "free_deal_requests_in_free_period:1"
    And I am signed up with email member001@nbs.com and password secret and role member
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:deal001|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper"
    And I sign in as member001@nbs.com with password secret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "something"
    And I press translated "member.leads.new.view.button_create"
    And I press translated "member.leads.show.view.ok_confirmation"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:deal002|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow "deal002"
    And I follow translated "deals.index.view.upgrade_subscription_to_get_deal"
    And I should be on my profile
    And I should see translated "subscriptions.subscription_upgrade_to_payable" with options "header: deal002"
    And I follow translated "subscriptions.listing.upgrade"
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "something"
    And I press translated "member.leads.new.view.button_create"
    And I press translated "member.leads.show.view.ok_confirmation"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:deal003|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper|premium_deal:1"
    When subscription plan exists with attributes "name:Premium deals member,assigned_roles:member,subscription_period:10,premium_deals:1"
    And subscription plan has following lines
      | name                 | price |
      | subscr premium line1 |  1000 |
      | subscr premium line2 |  2000 |
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow "deal003"
    And I follow translated "deals.index.view.upgrade_subscription_to_get_deal"
    And I should be on my profile
    And I should see translated "subscriptions.subscription_upgrade_to_premium_deals" with options "header: deal003"
    And I follow translated "subscriptions.listing.upgrade"
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "something"
    And I press translated "member.leads.new.view.button_create"
    And I press translated "member.leads.show.view.ok_confirmation"


  #9981
  @m28 @_requested @tgn @_done @_tested_elsewhere
  Scenario: When I got redirected to my profile after clicking "Upgrade subscription" I should be advised which subscription to choose in order to get deal

  #10046
  @m29 @_requested @tgn @_done @_tested
  Scenario: I can search for deals using their company name
  Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "premium_deal:1|description:short description1|published:1|header:deal001|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper"
  When I fill in "search_with_keyword" with "xeper"
  And I press translated "layout.fairdeals.main_menu.search"
  Then I should see "deal001"