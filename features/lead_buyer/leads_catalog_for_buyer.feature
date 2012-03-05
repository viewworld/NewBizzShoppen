@lead_catalog @$_lead_buyer @m1
Feature: Leads catalog for buyer

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  Given Category named "Sample category" already exists
  Given Category named "Another sample category" already exists within category named "Sample category"

  And Lead named "Super printers" exists within "Another sample category" category
  And lead Super printers exists with attributes "currency_id:1"
  And Lead named "Ultra printers" exists within "Another sample category" category
  And lead Ultra printers exists with attributes "currency_id:1"

  Given I am signed up and confirmed as user with email john@doe.com and password secret and role supplier

  And I sign in as john@doe.com with password secret
  And I follow translated "layout.main_menu.shared.browse_leads"

@_tested @bk @_done
Scenario: I can click add lead to my basket and I will get a notification “Lead was added to your basket”
  Given I follow "Another sample category"
  And I fill in "search_with_keyword" with "Super printers"
  And I press translated "leads.index.search.search_button"
  And I follow translated "leads.index.add_to_cart_link"
  Then I should see translated "supplier.cart_items.create.flash.cart_item_creation_successful"
  And I fill in "search_with_keyword" with "Super printers"
  And I press translated "leads.index.search.search_button"
  Then I should not see translated "leads.index.add_to_cart_link"

@_tested @selenium @_done
Scenario: I can toggle select leads on a displayed page
  Given I go to browse leads
  And I follow translated "common.more"
  And I follow "Another sample category"
  Then I check "mark_all"

@_tested @selenium @bulk @_done
Scenario: I can bulk add leads to my basket and I will get a notification “Leads were added to your basket”
  Given I go to browse leads
  And I follow translated "common.more"
  And I follow "Another sample category"
  Then I check "mark_all"
  And I press translated "leads.index.button_bulk_create_cart_item"
  Then I should see translated "supplier.bulk_cart_items.create.flash.n_cart_items_added" with options "count:2"

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

@m5 @added @unique_categories @tgn @_tested @_done
Scenario: I can see unique categories assigned to me in Browse leads
  Given Category This Customer Unique Category is created
  And category "This Customer Unique Category" is unique for user with email "john@doe.com" role "supplier"
  When I go to browse leads
  Then I should see "This Customer Unique Category"

@m5 @added @unique_categories @tgn @_tested @_done
Scenario: I should be able to browse leads in unique category assigned to me
Given Category This Customer Unique Category is created
  And category "This Customer Unique Category" is unique for user with email "john@doe.com" role "supplier"
  And Lead named "Lead Unique 1" exists within "This Customer Unique Category" category
  When I go to browse leads
  Then I follow category "This Customer Unique Category"
  And I should see "Lead Unique 1"

@m5 @added @unique_categories @tgn @_tested @_done
Scenario: I cannot see unique categories not assigned to me in Browse leads
  Given Category This Customer Unique Category is created
  And I have user with email other_john@doe.com and role supplier
  And category "This Customer Unique Category" is unique for user with email "other_john@doe.com" role "supplier"
  When I go to browse leads
  Then I should not see "This Customer Unique Category"

# The form should include.
# Company name
# Contact name
# contact e-mail
# Contact phone
# How many leads do you need a month:
@m13 @_requested @request_leads @ao @$_guest @_done @_tested
Scenario: I can request more leads for category
  Given there are no leads
  And Category TestingMoreLeadsRequest is created
  And I go to browse leads
  And I follow category "TestingMoreLeadsRequest"
  And I follow translated "leads.index.request_more_leads"
  And I fill in "email_template_preview_company_name" with "Selleo"
  And I fill in "email_template_preview_contact_name" with "Boss"
  And I fill in "email_template_preview_contact_email" with "boss@selleo.fake"
  And I fill in "email_template_preview_contact_phone" with "+483344556666"
  And I press translated "contact_us.new.view.send_email_button"
  Then last email sent should have been sent to recipient "admin@fairleads.com"
  And last email sent should have content "TestingMoreLeadsRequest"
  And last email sent should have content "Selleo"
  And last email sent should have content "Boss"
  And last email sent should have content "boss@selleo.fake"
  And last email sent should have content "+483344556666"
