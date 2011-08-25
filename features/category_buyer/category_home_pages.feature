@m5 @ao @category_home_pages  @requested
Feature: Category home pages

  @_done
  Scenario: I can see a list of news on category home page
    When Category named "Best Leads" already exists
    And there is a published news for category "Best Leads"
    And I am on category home page for Best Leads
    Then I should see "1" items on a list within "#news"

  @_done
  Scenario: I can see only news created for specific category
    When Category named "Best Leads" already exists
    And there is a published news for category "Best Leads"
    And I am on category home page for Best Leads
    Then I should see "1" items on a list within "#news"
    When Category named "Worst Leads" already exists
    And there is a published news for category "Worst Leads"
    And I am on category home page for Worst Leads
    Then I should see "1" items on a list within "#news"

  @added @_done @_tested
  Scenario: I can't see agent,buyer,purchase manager news
    When Category named "Best Leads" already exists
    And there are 1 agent news
    And there are 1 buyer news
    And there are 1 purchase manager news
    And there is a published news for category "Best Leads"
    And I am on category home page for Best Leads
    Then I should see "1" items on a list within "#news"

  @added @_done @_tested
  Scenario: I can see only news created for specific category on complete list
    When Category named "Best Leads" already exists
    And there is a published news for category "Best Leads"
    And there are 1 agent news
    And there are 1 buyer news
    And there are 1 purchase manager news
    And I am on category home page for Best Leads
    And I follow translated "category_home.show.view.complete_list_link" within "#news"
    Then I should see "1" rows in a table with headers within "table.generic"

  @_done
  Scenario: I can see a list of most recent category leads on category home page
    When Category named "Best Leads" already exists
    And lead LeadOne exists within category Best Leads
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    Then I should see "1" items on a list within "#latest_leads"
    And I should see "LeadOne" within "#latest_leads"

  @added @m6 @ao @_tested @_done
  Scenario: I can't see inactive leads on latest leads
    When there are no leads
    And a lead InactiveLead exists within category Best Leads and is bought by user kastomer@nbs.fake with role customer
    And lead "InactiveLead" has attributes "sale_limit:1"
    And I am on category home page for Best Leads
    Then I should see "1" items on a list within "#latest_leads"
    And I follow translated "agent_home.show.view.complete_list_link" within "#latest_leads"
    Then I should see translated "common.nothing_to_display"

  @_done
  Scenario: I can't see leads from other categories on recent leads
    When Category named "Best Leads" already exists
    And lead BestLead exists within category Best Leads
    And Category named "Worst Leads" already exists
    And lead WorstLead exists within category Worst Leads
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    Then I should see "1" items on a list within "#latest_leads"
    And I should see "BestLead" within "#latest_leads"
    And I should not see "WorstLead" within "#latest_leads"

  @_done
  Scenario: I can see complete list of category leads
    When Category named "Best Leads" already exists
    And there are "11" leads in category "Best Leads"
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    Then I should see "3" items on a list within "#latest_leads"
    When I follow translated "category_home.show.view.complete_list_link" within "#latest_leads"
    And I follow "3" within ".pagination"
    Then I should see "1" rows in a table with headers within ".leads_table tbody"

  @m6 @added @_done @_tested
  Scenario: I can see complete list of category leads as guest
    When Category named "Best Leads" already exists
    And there are "11" leads in category "Best Leads"
    And I am on category home page for Best Leads
    Then I should see "3" items on a list within "#latest_leads"
    When I follow translated "category_home.show.view.complete_list_link" within "#latest_leads"
    And I follow "3" within ".pagination"
    Then I should see CSS path "table.leads_table tbody tr.odd"
    And I should not see CSS path "table.leads_table tbody tr.even"

  @_done
  Scenario: I can buy selected leads from this category
    When Category named "Best Leads" already exists
    And there are "11" leads in category "Best Leads"
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "category_home.show.view.complete_list_link" within "#latest_leads"
    And I follow translated "leads.index.add_to_cart_link"
    Then I should see translated "buyer.cart_items.create.flash.cart_item_creation_successful"

  @_done
  Scenario: I can see registration panel on category home page when I'm a guest
    When Category named "Best Leads" already exists
    And I am on category home page for Best Leads
    Then I should see translated "category_home.show.view.category_buyer_signup"

  @_done
  Scenario: I can see log in panel on category home page when I'm a guest
    When Category named "Best Leads" already exists
    And I am on category home page for Best Leads
    Then I should see translated "activerecord.attributes.user.email"
    And I should see translated "activerecord.attributes.user.password"

  @added
  Scenario: I can see my purchased leads in panel on category home page when I'm logged in
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And a lead Best Lead exists within category Best Leads and is bought by user jon@lajoie.ca with role customer
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.shared.home"
    Then I should see CSS path "#my_leads"
    And I should see "1" items on a list within "#my_leads ul"
    And I should see "Best Lead" within "#my_leads"

  @added
  Scenario: I can access details of latest leads on category home page
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And lead Best Lead exists within category Best Leads
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.shared.home"
    And I follow translated "category_home.show.view.read_more_link" within "#latest_leads"
    Then I should be on the Best Lead lead page

  @_done
  Scenario: There should be room for a category picture on the category home pages
    When I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to administration categories
    And I follow translated "administration.categories.index.view.new_category"
    And I fill in "category_name" with "CategoryWithImage"
    And I fill in "category_description" with "Description"
    And attach the file "sample image" to "category_image_attributes_asset"
    And I select "EUR" from "category_currency_id"
    And I press translated "administration.categories.new.view.button_create"
    And I am on category home page for CategoryWithImage
    Then I should see CSS path "#category_image"

  @_done @_tested_elsewhere
  Scenario: When clicking on the row with lead (as customer in leads catalogue), prompt user if he wishes to add a lead to cart (and do so if he agrees)

  @m14 @requested @$_category_buyer @auto_buy @is @_done @_tested_elsewhere
  Scenario: I should see "Description" in the right column instead of "Latest leads" when I have auto-buy enabled

  @m14 @requested @$_category_buyer @auto_buy @is @_done @_tested
  Scenario: I should not have access to "Browse leads" when I have auto-buy enabled
    When Category named "Best Leads" already exists
    And I am on the home page
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I sign in as jon@lajoie.ca with password secret
    Then I should see "Best Leads"
    And category "Best Leads" is unique for user with email "jon@lajoie.ca" role "category_buyer"
    And I should see translated "layout.main_menu.shared.browse_leads"
    And I should not see translated "category_home.show.view.header_additional_information_label"
    And I follow translated logout link for jon@lajoie.ca
    And category "Best Leads" has attributes "auto_buy:true"
    And category named "Best Leads" is auto buy enabled
    And I sign in as jon@lajoie.ca with password secret
    And I should not see translated "layout.main_menu.shared.browse_leads"
    And I should see translated "category_home.show.view.header_additional_information_label"