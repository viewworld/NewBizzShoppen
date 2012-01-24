@m16 @procurement_manager_deals @requested @_deals @$_procurement_manager
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
  @m19 @requested @_done @_tested @tgn
  Scenario: When I am not logged in I should still see Get deal button and when click I should be prompted to log in or create new account and return to the get deal
    Given I visit domain http://fairdeals.dk
    And subscription plan named "Free member subscription" exists with attributes "is_active:0"
    Given user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I follow translated "supplier_home.show.view.create_new_membership_account"
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
    And I choose "user_member_subscription_plan_id"
    And I check "user_member_agreement_read"
    And I press translated "supplier_accounts.new.view.button_create_account"
    And I should see translated "deals.new.view.frame_header"

  #8340
  @m22 @requested @tgn @_done @_tested
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
    Then I should see translated "deals.index.view.contact_me"
    And I follow translated "deals.index.view.contact_me"
    And I should be on my profile
    Then I follow translated "subscriptions.listing.upgrade"
    And I should see "ultimate some funky deal"
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_phone_number" with "+49 23432423423234"

  #8340
  @m22 @requested @tgn @_done @_tested_elsewhere
  Scenario: When I try to get deal on free subscription and I decide to upgrade then I should be redirected to my profile page

  #7531
  @m19 @requested @_done @_tested @tgn
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
  @m19 @requested @_done @_tested @tgn
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

  @m20 @requested @tgn @_tested @_done
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

  @m21 @requested @_done @_tested @ao
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

  @m21 @requested @_done @_tested @ao @wip @_deprecated
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

  @m21 @requested @_done @_tested @ao @_deprecated
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
  @m22 @requested @ao @_done @_tested
  Scenario: I should not see activation dates on the listing and only deals with valid dates should be displayed
    Given a deal named "Some deal #1" exists within category "Electronics deals"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    Then I should not see "Activation"

  #8606
  @m23 @requested @tgn @_done @_tested
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
  @m27 @requested
  Scenario: When I am not signed in and I click get deal button then modal window should appear

  #9606
  @m27 @requested
  Scenario: It should be possible to sign in or sign up on the modal window view

  #9606
  @m27 @requested
  Scenario: After sign in/up I should see another modal windows where I can enter template information and note

  #9606
  @m27 @requested
  Scenario: I should be redirected to paypal or view deal after completing the modal window form

  #9410
  @m27 @requested
  Scenario: I can get deal when I have free subscription and I didn't used up my limit of free deals

  #9397
  @m27 @requested
  Scenario: When I get the deal with voucher and my payment from paypal haven't come yet then I should not see that deal under my deals

  #9397
  @m27 @requested
  Scenario: When I get the deal with voucher and my payment from paypal was successful then my request should be visible under My deals

  #9397
  @m27 @requested
  Scenario: When my request is cancelled I get email "Sorry your voucher is canceled since the payment did not go through.Please try again or contact fairleads if the problem persists"

  #9367
  @m27 @requested @tgn @_done @_tested_elsewhere
  Scenario: When I get the deal on the page for deal request I should not see linkedin/facebook urls but see company name

  #9811
  @m27 @requested @tgn @_done @_tested
  Scenario: I can get a Premium deal only if I am signed in as member and have subscription that allows getting Premium deals
    Given I am on the homepage
    Given a deal named "PrimaryDeal" exists within category "Electronics deals"
    And a deal named "PrimaryDeal" exists with attributes "published:1,premium_deal:1"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I should be on my profile
    Given user "procurment@nbs.com" has premium deals enabled
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I press translated "member.leads.new.view.button_create"
    And I should see "Blurb voucher confirmation page"