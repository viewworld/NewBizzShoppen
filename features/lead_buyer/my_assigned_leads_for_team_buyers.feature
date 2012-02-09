@m8b @lead_buyer
Feature: My assigned leads for team buyers

Background:
  Given I have user with email buyer.jim.jones@nbs.com and role supplier
  And an user with role lead_supplier and email leadbuyer.jon@nbs.com exists as subaccount for customer buyer.jim.jones@nbs.com
  And lead Lead #1111 is bought by user buyer.jim.jones@nbs.com with role supplier and is assigned to user leadbuyer.jon@nbs.com with role lead_supplier
  Given I am on the homepage
  And I make sure current locale is "en"
  And I sign in as leadbuyer.jon@nbs.com with password secret
  And I follow translated "layout.main_menu.lead_supplier.lead_purchases"

@requested @tgn @_tested @_done
Scenario: I can view details of leads assigned to me
  Then I follow "Lead #1111"
  And I should see translated "supplier.lead_purchases.show.view.header"

@m29 @requested @tgn @selenium @_done @_tested
Scenario: As team buyer I should not see uniqueness, novelty, agent certification, creator in lead purchase details panel and I should not be able to reassign the lead to other team members
  Then I should not see translated "lead_supplier.lead_purchases.index.view.bulk_assigned_field"
  And I follow translated "lead_purchases.listing.show_row"
  And I should not see translated "lead_purchases.listing.sale_limit_label"
  And I should not see translated "lead_purchases.listing.novelty_label"
  And I should not see translated "lead_purchases.listing.certification_label"
  And I should not see translated "lead_purchases.listing.creator_name"
