@lead_catalog @$_lead_buyer @m1
Feature: Lead Listing for buyer

Background:
  Given Category named "Sample category" already exists
  Given Category named "Another sample category" already exists within category named "Sample category"
  And Lead named "Super printers" exists within "Another sample category" category
  And Lead named "Ultra printers" exists within "Another sample category" category
  Given I am signed up and confirmed as user with email john@doe.com and password secret and role customer
  And I am on the homepage
  And I make sure current locale is English
  And I sign in as john@doe.com with password secret
  And I follow translated "layout.main_menu.shared.browse_leads"

@_tested @bk
Scenario: I can click add lead to my basket and I will get a notification “Lead was added to your basket”
  Given I follow "Another sample category"
  And I follow translated "leads.index.add_to_cart_link" for lead "Super printers"
  Then I should see translated "buyer.cart_items.create.flash.cart_item_creation_successful"

Scenario: I can toggle select leads on a displayed page

Scenario: I can bulk add leads to my basket and I will get a notification “Leads were added to your basket”