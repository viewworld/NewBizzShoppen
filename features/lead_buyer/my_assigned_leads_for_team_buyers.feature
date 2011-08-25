@m8b @lead_buyer
Feature: My assigned leads for team buyers

Background:
  Given I have user with email buyer.jim.jones@nbs.com and role customer
  And an user with role lead_buyer and email leadbuyer.jon@nbs.com exists as subaccount for customer buyer.jim.jones@nbs.com
  And lead Lead #1111 is bought by user buyer.jim.jones@nbs.com with role customer and is assigned to user leadbuyer.jon@nbs.com with role lead_buyer
  Given I am on the homepage
  And I make sure current locale is "en"
  And I sign in as leadbuyer.jon@nbs.com with password secret
  And I follow translated "layout.main_menu.lead_buyer.lead_purchases"

@requested @tgn @_tested
Scenario: I can view details of leads assigned to me
  Then I follow "Lead #1111"
  And I should see translated "buyer.lead_purchases.show.view.header"
  