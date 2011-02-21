@lead_catalog @$_big_buyer @m4 @tgn
Feature:  Leads catalog for big buyer

Background:
  Given I am on the homepage
  And I make sure current locale is English
  Given Category named "Sample category" already exists
  Given Category named "Another sample category" already exists within category named "Sample category"
  And Lead named "Super printers" exists within "Another sample category" category
  And Lead named "Ultra printers" exists within "Another sample category" category
  Given I am signed up and confirmed as user with email john@doe.com and password secret and role customer
  And User john@doe.com with role customer is big buyer
  And I sign in as john@doe.com with password secret
  And I go to browse leads

@_tested
Scenario: I can click add lead and I will see a notification “You added lead to your list”
  Given I follow "Another sample category"
  When I follow translated "leads.index.buy_lead"
  Then I should see translated "buyer.cart_items.create.flash.cart_item_bought_successful"

@_tested @selenium
Scenario: I can click bulk add leads and I will see a notification “You added leads to your list”
  Given I follow "Another sample category"
  When I check "mark_all"
  And I press translated "leads.index.button_bulk_buy_leads"
  Then I should see translated "buyer.bulk_cart_items.create.flash.n_leads_bought" with options "count:2"

@ao @m5 @added @_done @_tested
Scenario: I should not see leads that I've bought
  Given I go to browse leads
  And I follow "Another sample category"
  Then I should see "Super printers" within ".leads_table"
  And I should see "Ultra printers" within ".leads_table"
  When I follow translated "leads.index.buy_lead" for lead "Super printers"
  Then I should not see "Printers ultimate deal" within ".leads_table"
