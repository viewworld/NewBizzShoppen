@lead_catalog @$_lead_buyer @m1
Feature: Leads catalog for buyer

Background:
  Given I am on the homepage
  And I make sure current locale is English
  Given Category named "Sample category" already exists
  Given Category named "Another sample category" already exists within category named "Sample category"

  And Lead named "Super printers" exists within "Another sample category" category
  And Lead named "Ultra printers" exists within "Another sample category" category

  Given I am signed up and confirmed as user with email john@doe.com and password secret and role customer

  And I sign in as john@doe.com with password secret
  And I follow translated "layout.main_menu.shared.browse_leads"

@_tested @bk
Scenario: I can click add lead to my basket and I will get a notification “Lead was added to your basket”
  Given I follow "Another sample category"
  And I follow translated "leads.index.add_to_cart_link" for lead "Super printers"
  Then I should see translated "buyer.cart_items.create.flash.cart_item_creation_successful"
  And I follow translated "leads.index.add_to_cart_link" for lead "Super printers"
  Then I should see translated "buyer.cart_items.create.flash.cart_item_already_in_basket"

@_tested  @selenium
Scenario: I can toggle select leads on a displayed page
  Given I go to browse leads
  And I follow "Another sample category"
  Then I check "mark_all"

@_tested @selenium @bulk
Scenario: I can bulk add leads to my basket and I will get a notification “Leads were added to your basket”
  Given I go to browse leads
  And I follow "Another sample category"
  Then I check "mark_all"
  And I press translated "leads.index.button_bulk_create_cart_item"
  Then I should see translated "buyer.bulk_cart_items.create.flash.n_cart_items_added" with options "count:2"

@m5 @added @lead_templates
Scenario: I can see lead template fields with public values for each lead

@m5 @added @lead_templates
Scenario: I can see only lead template fields' names (not values) for hidden fields