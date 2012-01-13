@m1 @$_customer @customer
Feature: Customer module

Background:  Sign in user and set locale
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role supplier
  Then I sign in as bob@person.com with password supersecret

@_tested @_done
Scenario: I create account through signup
  Given I am not sign in
  And I am on the supplier home page
  When I follow translated "supplier_home.show.view.create_new_supplier_account"
  And I fill in "user_category_supplier_first_name" with "Bob"
  And I fill in "user_category_supplier_last_name" with "Geldof"
  And I fill in "user_category_supplier_phone" with "244224242424"
  And I fill in "user_category_supplier_email" with "bob1@person.com"
  And I fill in "user_category_supplier_screen_name" with "Bob Geldof"
  And I fill in "user_category_supplier_password" with "secret"
  And I fill in "user_category_supplier_password_confirmation" with "secret"
  And I fill in "user_category_supplier_address_attributes_address_line_1" with "Street 333"
  And I fill in "user_category_supplier_address_attributes_address_line_2" with "London"
  And I fill in "user_category_supplier_address_attributes_zip_code" with "390333"
  And I fill in "user_category_supplier_address_attributes_address_line_3" with "Geldow"
  And I select "Denmark" from "user_category_supplier_address_attributes_country_id"
  And I check "user_category_supplier_agreement_read"
  Then I press translated "supplier_accounts.new.view.button_create_account"

Scenario: I can follow "What do you want to do today?" links and they take me to appropriate places

@_tested_in_rspec @_done
Scenario: After signup I am assigned roles of Customer, Lead Buyer and Lead user

@_tested @_done @_deprecated
Scenario: I can see my unique RSS feed URL
#  Then I should see translated "supplier.interests.edit.view.rss_feed_url"

@_tested @_deprecated @_done
Scenario: I can select if I want to be notified about new leads matching my interests criteria
#  When I am on my profile
#  And I follow translated "my_profile.edit.view.interests_settings"
#  Then I check "user_notify_about_new_leads"

@_tested @_deprecated @_done
Scenario: I can select multiple lead categories that I am interested in
#  When I am on my profile
#  And I follow translated "my_profile.edit.view.interests_settings"
#  And I check "category_1"
#  And I check "category_2"
#  And I press translated "supplier.interests.edit.view.button_update"
#  Then I should see translated "supplier.interests.update.flash.interests_update_successful"

@_tested @_deprecated @_done
Scenario: I can select lead purchase value range that I am interested in
#  Given I select "3000" from "user_deal_value_range_start"
#  And I select "6000" from "user_deal_value_range_end"
#  And I press translated "supplier.interests.edit.view.button_update"
#  Then I should see translated "supplier.interests.update.flash.interests_update_successful"

@_tested @noguess @_deprecated @_done
Scenario: I can select multiple lead areas/countries that I am interested in
#  When I am on my profile
#  And I follow translated "my_profile.edit.view.interests_settings"
#  And I check "country_1"
#  And I check "country_2"
#  And I press translated "supplier.interests.edit.view.button_update"
#  Then I should see translated "supplier.interests.update.flash.interests_update_successful"

@m5 @tgn @_tested @_deprecated  @requested @_done
Scenario: I can select "all" as a Deal value
#  And I check "user_all_deal_values_enabled"
#  And I press translated "supplier.interests.edit.view.button_update"
#  Then I should see translated "supplier.interests.update.flash.interests_update_successful"

@m5 @unique_categories @added @_tested @tgn @requested @_done
Scenario: I should not see unique categories I'm not assigned to on my interests page
  Given Category Computers is created
  And category "Computers" is unique for user with email "bob@person.com" role "supplier"
  And I go to supplier interests
  And I should see "Electronics"
  And I should see "Business"
  And I should see "Leisure"
  And I should see "Computers"

@m5 @unique_categories @added @_tested @tgn @requested @_done
Scenario: I should not see categories on my interests page when I'm assigned to unique category
  Given I have user with email other_buyer34525biz@nbs.com and role supplier
  And Category OthersBuyerCategory is created
  And category "OthersBuyerCategory" is unique for user with email "other_buyer34525biz@nbs.com" role "supplier"
  Given Category Computers is created
  And category "Computers" is unique for user with email "bob@person.com" role "supplier"
  And I go to supplier interests
  And I should see "Electronics"
  And I should see "Business"
  And I should see "Leisure"
  And I should see "Computers"
  And I should not see "OthersBuyerCategory"

@m5 @unique_categories @added @_tested @tgn @requested @_done
Scenario: I should have my interests fixed to the unique category I'm assigned to
  Given there are no categories
  Given Category Computers is created
  And category "Computers" is unique for user with email "bob@person.com" role "supplier"
  And I go to supplier interests
  Then checkbox named "category_" should be checked

#home page is not used anymore
@added @m6 @ao @_done @_tested  @requested @_deprecated
Scenario: If customer is category buyer he/she can see also unique categories
#  When I sign out
#  And Category named "Best Leads" already exists
#  And Category named "Unique Leads" already exists
#  And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Best Leads"
#  And category "Unique Leads" is unique for user with email "jon@lajoie.ca" role "supplier"
#  And I am on the home page
#  And I sign in as jon@lajoie.ca with password secret
#  And I am on the home page
#  Then I should see "Best Leads"
#  And I should see "Unique Leads"

@added @m6 @ao @_done @_tested  @requested
Scenario: If customer is category buyer with assigned unique categories he can access them
  When I sign out
  And Category named "Best Leads" already exists
  And Category named "Unique Leads" already exists
  And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Best Leads"
  And category "Unique Leads" is unique for user with email "jon@lajoie.ca" role "supplier"
  And lead Uniqlead exists within category Unique Leads
  And I am on the home page
  And I sign in as jon@lajoie.ca with password secret
  And I am on category home page for Unique Leads
  Then I should be on category home page for Unique Leads
  And I should see "Uniqlead" within "#latest_leads"
  When I follow translated "category_home.show.view.complete_list_link" within "#latest_leads"
  Then I should be on category home leads page for Unique Leads
  And I should see "Uniqlead"
  And I should see "1" rows in a table with headers within ".leads_table tbody"

# all countries are selected after sign up
# https://redmine.selleo.com/issues/5423
@added @tgn @_tested @requested @_deprecated @_done
Scenario: On the interests page the country should be selected based on current locale

@m6 @tgn @_tested @selenium @_done
Scenario: I can use "Advanced search" in Browse leads with following fields: Deal value, Agent (creator), Agent’s (creator) rating (all,bronze, silver, gold), Uniqueness, Hotness
  Given I have user with email agent01@nbs.com and role agent
  And user "agent01@nbs.com" with role "agent" has attributes "certification_level:1, company_name:Xerox1"
  And I have user with email agent02@nbs.com and role agent
  And user "agent02@nbs.com" with role "agent" has attributes "certification_level:12, company_name:Xerox2"
  And I have user with email agent03@nbs.com and role agent
  And user "agent03@nbs.com" with role "agent" has attributes "certification_level:13, company_name:Xerox3"
  And I have user with email ultimate.buyer@nbs.com and role supplier

  Given lead Super printers #1 is created by user agent01@nbs.com with role agent
  And a lead Super printers #1 exists within category Computers and is bought by user ultimate.buyer@nbs.com with role supplier
  And lead Super printers #1 exists with attributes "hotness_counter:0, sale_limit:9, purchase_value:5200"

  Given lead Super printers #2 is created by user agent02@nbs.com with role agent
  And user "agent02@nbs.com" with role "agent" has attributes "screen_name:Xerox2 Agent02"
  And a lead Super printers #2 exists within category Computers and is bought by user ultimate.buyer@nbs.com with role supplier
  And lead Super printers #2 exists with attributes "hotness_counter:1, sale_limit:2, purchase_value:5900"

  Given lead Super printers #3 is created by user agent03@nbs.com with role agent
  And a lead Super printers #3 exists within category Computers and is bought by user ultimate.buyer@nbs.com with role supplier
  And lead Super printers #3 exists with attributes "hotness_counter:2, sale_limit:5, purchase_value:10200"

  And I go to browse leads
  And I follow category "Computers"
  And I follow translated "common.advanced_search"
  And I wait 1 second
  Then I select "Xerox2 Agent02" from "search_with_created_by"
  And I press translated "leads.index.search.search_button"
  Then I should see "Super printers #2"
  And I should not see "Super printers #1"
  And I should not see "Super printers #3"
  Then I select "" from "search_with_created_by"
  And I select translated "models.lead.certification.lvl3" from "search_with_certification_level"
  And I press translated "leads.index.search.search_button"
  Then I should see "Super printers #3"
  And I should not see "Super printers #1"
  And I should not see "Super printers #2"
  Then I select "" from "search_with_certification_level"
  And I select "9" from "search_with_sale_limit"
  And I press translated "leads.index.search.search_button"
  Then I should see "Super printers #1"
  And I should not see "Super printers #2"
  And I should not see "Super printers #3"
  Then I select "" from "search_with_sale_limit"
  And I select translated "models.lead.hotness.lvl1" from "search_with_hotness"
  And I press translated "leads.index.search.search_button"
  Then I should see "Super printers #2"
  And I should not see "Super printers #1"
  And I should not see "Super printers #3"
  Then I select "" from "search_with_hotness"
  And I select "5000" from "search_with_deal_value_from"
  And I select "6000" from "search_with_deal_value_to"
  And I press translated "leads.index.search.search_button"
  Then I should see "Super printers #1"
  And I should see "Super printers #2"
  And I should not see "Super printers #3"

@requested @m8 @tgn @selenium @_tested @_done
Scenario: Advanced search in browse leads should be hidden by default
  Given Category Computers is created
  And I go to browse leads
  And I follow category "Computers"
  And I follow translated "common.advanced_search"
  Then I should see translated "leads.index.search.deal_value_from_label"

@requested @m8b @tgn @selenium @_tested @_done
Scenario: Advanced search in browse leads should contain regions and all fields should be included in the hidden advanced search except keyword
  Given country "Denmark" has regions "DK region #1, DK region #2"
  And I have user with email agent01@nbs.com and role agent
  And lead Super printers #1 is created by user agent01@nbs.com with role agent
  And a lead Super printers #1 exists within category Computers and is bought by user ultimate.buyer@nbs.com with role supplier
  And lead "Super printers #1" is created for country "Denmark" with region "DK region #1"
  And lead Super printers #2 is created by user agent01@nbs.com with role agent
  And a lead Super printers #2 exists within category Computers and is bought by user ultimate.buyer@nbs.com with role supplier
  And lead "Super printers #2" is created for country "Denmark" with region "DK region #2"
  And I go to browse leads
  And I follow category "Computers"
  And I follow translated "common.advanced_search"
  Then I select "Denmark" from "search_with_country"
  And I select "DK region #2" from "search_with_region"
  And I press translated "leads.index.search.search_button"
  Then I should see "Super printers #2"
  And I should not see "Super printers #1"

# On the configure you interests page there should be a back button, when it is selected from my profile page
# except for first login
@m7 @requested @tgn @_tested @_deprecated @_done
Scenario: I can see a back button when on configure interests page
#  Given I should not see "Back"
#  When I go to my profile
#  And I follow translated "my_profile.edit.view.interests_settings"
#  Then I should see "Back"

@m10 @requested @_done @_tested
Scenario: After first login I should be redirected to my home page instead of interests config
  Then I should be on supplier home

@m10 @requested @_done @_tested
Scenario: Interests are automatically configured after account is created - all countries and categories should be selected with disabled notifications
  When I am on supplier interests page
  Then checkbox named "country_1" should be checked
  And checkbox named "country_2" should be checked
  And checkbox named "category_1" should not be checked
  And checkbox named "category_2" should not be checked
  And checkbox named "category_3" should not be checked
